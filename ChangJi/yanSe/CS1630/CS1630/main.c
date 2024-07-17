#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"
#include "bsp_hs6230.h"
#include "bsp_delay.h"
#include "key.h"
#include "app_tx.h"
#include "bsp_usart.h"

#define UPDATE_REG(x)  __asm__("MOVR _" #x ",F")

volatile unsigned char system_tick = 0;//系统计时变量
extern volatile unsigned char SLEEP_STATUS;

void isr_sleep() __interrupt(0)
{
  static unsigned char tick_1s = 0;
  static unsigned char tick_30s = 0;
  if(INTFbits.T0IF)
  {
    INTFbits.T0IF = 0;//清除中断标志
    TMR0 = 100;//Timer0寄存器重新从100开始计数
    //每5ms进入中断，计数200次就是1s
    if(++tick_1s >= 200)
    {
      tick_1s = 0;
      if(++tick_30s >= 30)
      {
        tick_30s = 0;
        if(SLEEP_STATUS == 1)
        {
          SLEEP();
        }
      }
    }
  }
}

void isr_wake_up() __interrupt(1)
{
  if(INTFbits.PABIF)
  {
    INTFbits.PABIF = 0;
  }
}

void timer_init(void)
{
  PCON1 = C_TMR0_Dis;
  TMR0 = 100;
  T0MD = C_PS0_TMR0;
  T0MD |= C_PS0_Div64;
  INTE = C_INT_TMR0;
  INTF = 0;
}

void wake_up_init(void)
{
  AWUCON = 0xC3;
  BWUCON = 0x0f;
  INTE |= C_INT_PABKey;
  INTF = 0;
}

void main(void)
{
  DISI();
  key_init();
  usart_init();
  HS6230_Init();
  timer_init();
  wake_up_init();
  ENI();
  PORTBbits.PB4 = 1;
  delay_250ms();
  PORTBbits.PB4 = 0;
  delay_250ms();
  PORTBbits.PB4 = 1;
  delay_250ms();
  PORTBbits.PB4 = 0;
  delay_250ms();

  while (1)
  {
    Check_Keydown();
	}
}