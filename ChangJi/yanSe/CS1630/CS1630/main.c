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
volatile unsigned char g_timer0_delay_conut_1 = 0;
volatile unsigned char g_timer0_delay_conut_2 = 0;

void isr(void) __interrupt(0)
{
  if(INTFbits.PABIF)
  {
    INTFbits.PABIF = 0;					// 清除PABIF（PortB输入变化中断标志位）
  }
}

void wake_up_init(void)
{
  AWUCON = 0xfc;
  BWUCON = 0x00;
  IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
  APHCON = 0b00100011; // 设置2、3、4、6、7上拉
  INTE = C_INT_PABKey;
  INTF = 0x00;
}

void main(void)
{
  DISI();
  key_init();
  CS1630_Init(); // 初始化CS1630模块
  ENI();
  unsigned char sleep_status = 1;

  while (1)
  {
    key_init();
    sleep_status = Check_Keydown();

    if(sleep_status == 0)
    {
     g_timer0_delay_conut_1 = 0;
     g_timer0_delay_conut_2 = 0;
    }

    g_timer0_delay_conut_1 ++;

    if(g_timer0_delay_conut_1 == 255)
    {
     g_timer0_delay_conut_1 = 0;
     g_timer0_delay_conut_2 ++;
    }

    if(g_timer0_delay_conut_2 == 255)
    {
     g_timer0_delay_conut_2 = 0;
     wake_up_init();
     UPDATE_REG(PORTA);
     INTF = 0x00;
     SLEEP();
     INTFbits.PABIF = 0;	// 清除PABIF（PortB输入变化中断标志位）
    }
	}
}

/*************************************************************************************************/



/*************************************************************************************************/