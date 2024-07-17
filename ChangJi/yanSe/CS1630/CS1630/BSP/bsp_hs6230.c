#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"
#include "bsp_hs6230.h"
#include "bsp_delay.h"
#include "bsp_usart.h"

void HS6230_Soft_Rst(void)
{
	unsigned char soft_temp[4];
	HS6230_Bank_Switch(RF_Bank1);

	HS6230_read_buffer(HS6230_BANK1_PLL_CTL0, soft_temp, 4); // 读取该寄存器状态
	soft_temp[3] |= 0x80; // 将最低位置0
	HS6230_wr_buffer(HS6230_BANK1_PLL_CTL0, soft_temp, 4);
	HS6230_read_buffer(HS6230_BANK1_PLL_CTL0, soft_temp, 4);
	HS6230_Bank_Switch(RF_Bank0);
}

void HS6230_Init(void)
{

	unsigned char temp[5];
	unsigned char regval;

	RF_softSPI_Init();

#if 1/* 实际芯片出来之后，要用这样的方式初始化芯片，使用FPGA板测试的时候用下面的初始化过程 */
	/****************************保存校准值*******************************/
	HS6230_CE_Low();
	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x02); // 先断一下电，然后再等待一下在开始等待校准
	delay_ms(4);

	HS6230_Soft_Rst();

	HS6230_CE_High();
	delay_us(16);
	HS6230_CE_Low();

	while((HS6230_read_byte(HS6230_BANK0_SETUP_VALUE) & 0x01) == 0x00); // 等待校准结束

	/***********************************************************/
	HS6230_Bank_Switch(RF_Bank1);

	regval = HS6230_read_byte(HS6230_BANK1_DAC_RANGE); // 记录校准值
	HS6230_read_buffer(HS6230_BANK1_PLL_CTL0, temp, 4);
	temp[0] = 0x07;
	temp[1] = 0x80;
	temp[2] |= (BIT6+BIT3);
	HS6230_wr_buffer(HS6230_BANK1_PLL_CTL0, temp, 4); // 配置Bank1 的 PLL_CTL0为07  80  48

	HS6230_write_byte(HS6230_BANK1_DAC_RANGE, regval); // 恢复校准值，后续休眠唤醒后不用再次校准
	HS6230_Bank_Switch(RF_Bank0);

	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x01);
	/***********************************************************/
#endif

#if 1
	temp[0] = 0x12;
	temp[1] = 0x34;
	temp[2] = 0x56;
	temp[3] = 0x78;
	temp[4] = 0x9a;
#endif
    HS6230_wr_buffer(HS6230_BANK0_TX_ADDR, temp, 5); // set address

//	HS6230_read_buffer(HS6230_BANK0_SETUP_AW, temp, 1);
//	temp[0] &= 0x03;
//	temp[0] |= BIT2;
//	HS6230_wr_buffer(HS6230_BANK0_SETUP_AW, temp, 1);

	HS6230_Clear_All_Irq();
	HS6230_Flush_Tx();
	CLRWDT();

}

void HS6230_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len)
{

	HS6230_CSN_LOW;
	SPI_SendByte(RF_R_REGISTER|addr);

	while(len--)
	{
		*buf++ = SPI_ReadByte();
	}
//    while (SPI_I2S_GetFlagStatus(HS6230_SPI, SPI_I2S_FLAG_BSY) == SET);
	delay_us(1);
	HS6230_CSN_HIGH;
}

/*Read One Register */
unsigned char HS6230_read_byte(unsigned char addr)
{
	unsigned char rxdata;

	HS6230_CSN_LOW;
	SPI_SendByte(RF_R_REGISTER|addr);
	rxdata = SPI_ReadByte();
	HS6230_CSN_HIGH;

	return(rxdata);
}

/*Write One Register*/
void HS6230_write_byte(unsigned char addr,unsigned char D)
{

	HS6230_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER|addr);
	SPI_SendByte(D);
	HS6230_CSN_HIGH;

}

void HS6230_wr_buffer(unsigned char addr, unsigned char* buf,unsigned char len)
{

	HS6230_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER|addr);
	while(len--)
	{
		SPI_SendByte(*buf++);
	}
	HS6230_CSN_HIGH;

}

/*write Commad  function, cmd = code; D = data*/
void HS6230_wr_cmd(unsigned char cmd,unsigned char D)
{
	HS6230_CSN_LOW;
	SPI_SendByte(cmd);
	SPI_SendByte(D);
	HS6230_CSN_HIGH;
}

/*write Commad  function, cmd = code; D = data*/
void HS6230_Bank_Switch(unsigned char bank)
{
	unsigned char sta;

	sta = HS6230_read_byte(HS6230_BANK0_STATUS);

	if(bank != RF_Bank0) // 切1
	{
		if(!(sta & RF_BANK0))
		{
		    HS6230_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
		}
	}
	else
	{
		if(sta & RF_BANK1) // 切0
		{
			HS6230_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
		}
	}
}

/*buf:data buffer; len:[1~32] ; cmd: HS6200_W_TX_PAYLOAD/HS6200_W_TX_PAYLOAD_NOACK*/
void HS6230_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len)
{
	unsigned char sta;

	sta = HS6230_read_byte(HS6230_BANK0_STATUS);
	if(!(sta&RF_STATUS_TX_FULL))
	{
		HS6230_wr_buffer(cmd, buf, len);
	}
}

void HS6230_ModeSwitch(RF_ModeTypeDef mod)
{
	unsigned char tmp;

	tmp = HS6230_read_byte(HS6230_BANK0_CONFIG);
	if(mod != Rf_PRX_Mode)
	{
		tmp &= 0xFE;
	}
	else
	{
		tmp |= 0x01;
	}
	HS6230_write_byte(HS6230_BANK0_CONFIG, tmp);

	if(mod == Rf_Carrier_Mode)
	{
		tmp = 0x80 | HS6230_read_byte(HS6230_BANK0_RF_SETUP);
		HS6230_write_byte(HS6230_BANK0_RF_SETUP, tmp);
	}
}

/*Clear All Irq*/
void HS6230_Clear_All_Irq(void)
{
	HS6230_write_byte(HS6230_BANK0_STATUS, 0x70);
}

/*Flush Tx*/
void HS6230_Flush_Tx(void)
{
	HS6230_CSN_LOW;
	SPI_SendByte(RF_FLUSH_TX);
	HS6230_CSN_HIGH;
}

void HS6230_CE_High(void)
{
	unsigned char reg_val = 0;
//	RF_CE_HIGH;
	reg_val = HS6230_read_byte(HS6230_BANK0_SETUP_VALUE);
	reg_val |= BIT3;
	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, reg_val);
}

void HS6230_CE_Low(void)
{
//	RF_CE_LOW;
	unsigned char reg_val = 0;
	reg_val = HS6230_read_byte(HS6230_BANK0_SETUP_VALUE);
	reg_val &= ~BIT3;
	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, reg_val);
}

void Enter_sleep(void)
{
	unsigned char ret;

	/****************************************************************/

	ret = HS6230_read_byte(HS6230_BANK0_CONFIG);
	ret &= ~0x02;
	HS6230_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER | HS6230_BANK0_CONFIG);
	SPI_SendByte(ret);

	IOSTB = C_PB5_Input;

	HS6230_CSN_HIGH;

	delay_us(10);
//	printf("\n wait for wakeup.\n");
	while(1 == RF_Reag_SDIO());
//	printf("\n wakeup.\n");
	HS6230_CSN_LOW;
	delay_us(10);
	HS6230_CSN_HIGH;
	IOSTB = C_PB5_Output;
	/****************************************************************/
}

/*-------------------------------------------End Of File---------------------------------------------*/
