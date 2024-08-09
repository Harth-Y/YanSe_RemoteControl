#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"
#include "bsp_cs1630.h"
#include "bsp_delay.h"
#include "key.h"
#include "app_tx.h"
//#include "bsp_usart.h"

#define UPDATE_REG(x)  __asm__("MOVR _" #x ",F")
#define C_PWM_LB_DUTY_00H	0x00
#define C_PWM_LB_DUTY_40H	0x40
#define C_PWM_LB_DUTY_01H	0x01
#define C_PWM_LB_DUTY_FFH	0xFF
volatile unsigned char sleep_conut_1 = 0;
volatile unsigned char sleep_conut_2 = 0;

/*************************************************************************************************/

void wake_up_init(void)
{
  AWUCON = 0xfc;
  BWUCON = 0x00;
  // 配置PA2、3、4、5、6、7为输入
  IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;
  APHCON = 0b00100011; // 设置2、3、4、6、7上拉
  INTE = C_INT_PABKey;
  INTF = 0x00;
}

void open_WDT(void)
{
  PCON |= C_WDT_En;	//使能看门狗
  PCON |= C_LVR_En;	//低压复位使能
}

void close_WDT(void)
{
  PCON &= ~C_WDT_En;
  PCON &= ~C_LVR_En;
}

void go_to_sleep(void)
{
  close_WDT();
  wake_up_init();
  UPDATE_REG(PORTA);
  INTF = 0x00;
  SLEEP();
}

void sleep_count(unsigned char s_sleep_status)
{
  if(s_sleep_status != 0) // 有按键被按下，重新计时
  {
    sleep_conut_1 = 0;
    sleep_conut_2 = 0;
  }

  sleep_conut_1 ++;

  if(sleep_conut_1 >= 255)
  {
    sleep_conut_1 = 0;
    sleep_conut_2 ++;
  }

  if(sleep_conut_2 >= 32) // 5s
  {
    sleep_conut_2 = 0;
    go_to_sleep();
  }
}

void send_data(unsigned char CodeValue)
{
  unsigned char KeyStatus = 0;
  unsigned char KeyStatus_s = 0;
  if(CodeValue != 0)
  {
    key_init();
    KeyStatus = PORTA & 0xfc;
    KeyStatus_s = 1;

    while(0xfc != (PORTA & 0xfC))
    {
      // led();
      send_ble_packet(CodeValue);
      // if(KeyStatus == 0)
      // {
      //   led();
      // }
      if(KeyStatus_s == 1)
      {
        send_ble_packet(CodeValue);
        // led();
        KeyStatus_s = 0;
        PB4 = 0;
        delay_250ms();
      }
      PB4 = 0;
      delay_ms(50);
      key_init();
      if(KeyStatus != (PORTA & 0xfc)) // 若与一开始按的不是同一个按键则退出重新检测
      break;
    }
  }
}

/*************************************************************************************************/

void main(void)
{
  DISI();
  key_init();
  CS1630_Init();
  open_WDT();
  ENI();

  unsigned char sCodeValue = 0;

  while (1)
  {
    CLRWDT();
    key_init();
    sCodeValue = Check_Keydown();
    if(sCodeValue != 0)
    {
      send_data(sCodeValue);
    }
    sleep_count(sCodeValue);
    sCodeValue = 0;
	}
}

/*************************************************************************************************/

void isr(void) __interrupt(0)
{
  if(INTFbits.PABIF)
  {
    open_WDT();
    INTFbits.PABIF = 0;
  }
}

/*************************************************************************************************/