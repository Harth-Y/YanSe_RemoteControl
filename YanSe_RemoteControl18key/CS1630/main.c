#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"
#include "bsp_cs1630.h"
#include "bsp_delay.h"
#include "key.h"
#include "app_tx.h"
#include "rom.h"
//#include "bsp_usart.h"

#define UPDATE_REG(x)  __asm__("MOVR _" #x ",F")

volatile unsigned char slepp_time_count_1 = 0;
volatile unsigned char sleep_time_count_2 = 0;
volatile unsigned char old_key_value = 0xff;
volatile unsigned char Serial_Number = 0;
extern volatile unsigned char key_status_change;
extern volatile unsigned char one_key_twice_dowm;

void isr(void) __interrupt(0)
{
    if(INTFbits.PABIF)
    {
      key_status_change = 1;
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

void CS1630_init_main(void)
{
  CS1630_Init(); // 初始化CS1630模块
  CS1630_CE_Low(); // 设置CE引脚为低电平，准备发送数据
  CS1630_ModeSwitch(Rf_PTX_Mode); // 切换到发送模式

  // 配置CS1630模块的寄存器
  CS1630_write_byte(CS1630_BANK0_FEATURE, 0x04);
  CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0f);
  CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x04); // 配置值
  CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
  delay_ms(2);
}

void main(void)
{
  DISI();
  CS1630_init_main();
  wake_up_init();
  open_WDT();
  ENI();

  unsigned char sleep_status = 1;
  unsigned char key_value = 0;
  unsigned char Code_Value = 0;
  unsigned char old_key_status = 0;
  key_status_change = 0;

  while (1)
  {
    CLRWDT();
    key_init();
    key_value = Check_Keydown();

    // 如果有按键按下则重置计时器并且计算码值
    if(key_value != 0)
    {
      slepp_time_count_1 = 0;
      sleep_time_count_2 = 0;
      Code_Value = key_value - 1;
    }
    else
    {
      Code_Value = 0xff;
    }

    if(key_value != 0) // 当键值不为0
    {
      if(old_key_status == 0) // 上一次按键扫描结果为空时，流水号增加
      {
        Serial_Number++;
        send_ble_packet(Code_Value, 15, Serial_Number);
      }
      else // 当上一次按键扫描结果不为空
      {
        if(key_value == old_key_value) // 当键值与旧键值一致
        {
          if(one_key_twice_dowm == 0) // 不是从中断跳出来的，流水号不增加,判定为长按
          {
            send_ble_packet(Code_Value, 0, Serial_Number);
            delay_ms(90);
          }
          else // 是从中断跳出来的，流水号增加，判定为快速短按
          {
            one_key_twice_dowm = 0;
            Serial_Number++;
            send_ble_packet(Code_Value, 15, Serial_Number);
          }
        }
        else // 当键值与旧键值不一致，流水号增加
        {
          Serial_Number++;
          send_ble_packet(Code_Value, 15, Serial_Number);
        }
      }
    }
    CLRWDT();

    // 更新旧键值以及旧按键状态
    if(key_value != 0)
    {
      old_key_status = 1;
      old_key_value = key_value;
    }
    else
    {
      old_key_status = 0;
    }

    // 睡眠机制
    slepp_time_count_1 ++;
    if(slepp_time_count_1 == 255)
    {
      slepp_time_count_1 = 0;
      sleep_time_count_2 ++;
    }
    if(sleep_time_count_2 == 20)
    {
      sleep_time_count_2 = 0;
      wake_up_init();
      close_WDT();
      UPDATE_REG(PORTA);
      INTF = 0x00;
      SLEEP();
      open_WDT();
    }
	}
}
