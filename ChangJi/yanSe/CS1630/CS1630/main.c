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
  CS1630_Init();
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
    ENI();
    SLEEP();
    INTFbits.PABIF = 0;	// 清除PABIF（PortB输入变化中断标志位）
	}
}