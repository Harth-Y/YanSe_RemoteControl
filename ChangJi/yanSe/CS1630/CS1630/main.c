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

// volatile unsigned char system_tick = 0;//系统计时变量
// extern volatile unsigned char SLEEP_STATUS;

// void isr_sleep() __interrupt(0)
// {
//   static unsigned char tick_1s = 0;
//   static unsigned char tick_30s = 0;
//   if(INTFbits.T0IF)
//   {
//     INTFbits.T0IF = 0;//清除中断标志
//     TMR0 = 100;//Timer0寄存器重新从100开始计数
//     //每5ms进入中断，计数200次就是1s
//     if(++tick_1s >= 200)
//     {
//       usart_send_string("[MAIN] 1s\r\n");
//       tick_1s = 0;
//       if(++tick_30s >= 30)
//       {
//         tick_30s = 0;
//         if(SLEEP_STATUS == 1)
//         {
//           wake_up_init();
//           SLEEP();
//         }
//       }
//     }
//   }
// }

void isr(void) __interrupt(0)
{
    if(INTFbits.PABIF)
    {
      usart_send_string("[MAIN] key down it\r\n");

      INTFbits.PABIF = 0;					// 清除PABIF（PortB输入变化中断标志位）
    }
}

// void timer_init(void)
// {
//   PCON1 = C_TMR0_Dis;
//   TMR0 = 100;
//   T0MD = C_PS0_TMR0;
//   T0MD |= C_PS0_Div64;
//   INTE = C_INT_TMR0;
//   INTF = 0;
// }

void wake_up_init(void)
{
  AWUCON = 0xfc;
  BWUCON = 0x00;
  IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input; //| C_PA7_Input;  // 配置PA2、3、4、5、6为输入
  APHCON = 0b10100011; // 设置2、3、4、6上拉

  INTE = C_INT_PABKey;
  INTF = 0x00;
}

void main(void)
{
  DISI();
  usart_init();
  HS6230_Init();
  //timer_init();
  wake_up_init();
  ENI();

  while (1)
  {
    DISI();
    key_init();
    Check_Keydown();
    wake_up_init();
    UPDATE_REG(PORTA);
    INTF = 0x00;
    usart_send_string("[MAIN] sleep\r\n");
    ENI();
    SLEEP();
    INTFbits.PABIF = 0;	// 清除PABIF（PortB输入变化中断标志位）
    usart_send_string("[MAIN] wake up\r\n");
	}
}