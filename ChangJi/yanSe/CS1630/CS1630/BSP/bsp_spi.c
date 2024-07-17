//------------------------------------------------------------------------------------
// bsp_spi.c
//------------------------------------------------------------------------------------
// Copyright 2019, HunterSun Electronics Co., Ltd.
// crazy_code@yeah.net
// 2019-07-17
//
// Program Description:
//
//
//

#include <ny8.h>
#include "NY8_constant.h"
#include "ny8a054e.h"
#include "bsp_spi.h"
#include "bsp_usart.h"

void RF_softSPI_Init(void)
{
	//usart_send_string("SPI init\r\n");
    // 初始化SPI端口
	IOSTA = C_PA0_Output; // SCK
	IOSTA = C_PA1_Output; // CSN
	IOSTB = C_PB5_Output; // SDA

    // 将CSN置为低电平
    RF_CSN_L();
}

unsigned char RF_spi_wrd(unsigned char Data)
{
	unsigned char dt, dts;
	dt = 0;
	dts = Data;
	SPI_SendByte(dts);
	dt = SPI_ReadByte();
	return dt;
}

void SPI_SendByte(unsigned char TxData)
{
	int i;
	unsigned char data_output_bit;
	IOSTB = C_PB5_Output;

	for(i = 0; i < 8; i ++)
	{
		data_output_bit = TxData & 0x80 ? 1 : 0;
		RF_SCK_L();
		if(data_output_bit)
		{
			RF_SDIO_H();
		}
		else
		{
			RF_SDIO_L();
		}
		RF_SCK_H();
		NOP_DELAY();
		TxData = TxData << 1;
	}

	RF_SDIO_L();
	RF_SCK_L();

  	NOP_DELAY();NOP_DELAY();NOP_DELAY();
}

unsigned char SPI_ReadByte(void)
{
	unsigned char bit_ctr;
	unsigned char byte = 0;
	unsigned char temp = 0;

	IOSTB = C_PB5_Input;

	for(bit_ctr = 0;bit_ctr < 8;bit_ctr ++) // output 8-bit
	{
		byte = byte << 1;
		RF_SCK_H();
		temp = RF_Reag_SDIO();
		byte |= temp;
		RF_SCK_L();
		NOP();
	}

	return (byte); // return read byte
}
/*-------------------------------------------End Of File---------------------------------------------*/
