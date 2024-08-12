#ifndef __BSP_CS1630_H__
#define __BSP_CS1630_H__

#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"

#define CS1630_CSN_HIGH	                do {PORTAbits.RF_CSN_PIN = 1; delay_us(1); }while(0);
#define CS1630_CSN_LOW                  PORTAbits.RF_CSN_PIN = 0;

// #define Delay1us(n)						delay_us(n)
// #define Delay1ms(n)      				delay_ms(n)
// #define Delay10ms(n)     				delay_ms(10*n)

extern void CS1630_Soft_Rst(void);
extern void CS1630_Init(void);
extern void CS1630_Clear_All_Irq(void);
extern void CS1630_Flush_Tx(void);
extern void CS1630_CE_High(void);
extern void CS1630_CE_Low(void);
extern void CS1630_ModeSwitch(RF_ModeTypeDef mod);
extern void CS1630_Bank_Switch(unsigned char bank);
extern void CS1630_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len);
extern unsigned char CS1630_read_byte(unsigned char addr);
extern void CS1630_write_byte(unsigned char addr,unsigned char D);
extern void CS1630_wr_buffer(unsigned char addr, unsigned char* buf,unsigned char len);
extern void CS1630_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len);
extern void Enter_sleep(void);
extern void CS1630_Dump_RF_Register(void);

#endif  /*__BSP_HS6200_H__*/

/*-------------------------------------------End Of File---------------------------------------------*/
