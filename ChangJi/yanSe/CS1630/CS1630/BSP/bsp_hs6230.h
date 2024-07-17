//------------------------------------------------------------------------------------
// bsp_hs6230.h
//------------------------------------------------------------------------------------
// Copyright 2019, HunterSun Electronics Co., Ltd.
// crazy_code@yeah.net
// 2019-07-19
//
// Program Description:
//
//
//


#ifndef __BSP_HS6230_H__
#define __BSP_HS6230_H__

#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"

#define HS6230_CSN_HIGH	                do {PORTAbits.RF_CSN_PIN = 1; delay_us(1); }while(0);
#define HS6230_CSN_LOW                  PORTAbits.RF_CSN_PIN = 0;

// #define Delay1us(n)						delay_us(n)
// #define Delay1ms(n)      				delay_ms(n)
// #define Delay10ms(n)     				delay_ms(10*n)

extern void HS6230_Soft_Rst(void);
extern void HS6230_Init(void);
extern void HS6230_Clear_All_Irq(void);
extern void HS6230_Flush_Tx(void);
extern void HS6230_CE_High(void);
extern void HS6230_CE_Low(void);
extern void HS6230_ModeSwitch(RF_ModeTypeDef mod);
extern void HS6230_Bank_Switch(unsigned char bank);
extern void HS6230_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len);
extern unsigned char HS6230_read_byte(unsigned char addr);
extern void HS6230_write_byte(unsigned char addr,unsigned char D);
extern void HS6230_wr_buffer(unsigned char addr, unsigned char* buf,unsigned char len);
extern void HS6230_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len);
extern void Enter_sleep(void);
extern void HS6230_Dump_RF_Register(void);

#endif  /*__BSP_HS6200_H__*/

/*-------------------------------------------End Of File---------------------------------------------*/
