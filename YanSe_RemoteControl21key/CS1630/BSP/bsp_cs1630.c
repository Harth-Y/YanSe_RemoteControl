#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_rf.h"
#include "bsp_spi.h"
#include "bsp_cs1630.h"
#include "bsp_delay.h"
#include "bsp_usart.h"
#include "rom.h"
void CS1630_Soft_Rst(void)
{
	unsigned char soft_temp[4];
	CS1630_Bank_Switch(RF_Bank1);

	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4); // 读取该寄存器状态
	soft_temp[3] |= 0x80; // 将最低位置0
	CS1630_wr_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4);
	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4);
	CS1630_Bank_Switch(RF_Bank0);
}

void CS1630_Init(void)
{

	unsigned char temp[5];
	unsigned char regval;

	RF_softSPI_Init();

#if 1/* 实际芯片出来之后，要用这样的方式初始化芯片，使用FPGA板测试的时候用下面的初始化过程 */
	/****************************保存校准值*******************************/
	CS1630_CE_Low();
	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x02); // 先断一下电，然后再等待一下在开始等待校准
	delay_ms(4);

	CS1630_Soft_Rst();

	CS1630_CE_High();
	delay_us(16);
	CS1630_CE_Low();

	while((CS1630_read_byte(CS1630_BANK0_SETUP_VALUE) & 0x01) == 0x00); // 等待校准结束

	/***********************************************************/
	CS1630_Bank_Switch(RF_Bank1);

	regval = CS1630_read_byte(CS1630_BANK1_DAC_RANGE); // 记录校准值
	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, temp, 4);
	temp[0] = 0x07;
	temp[1] = 0x80;
	temp[2] |= (BIT6+BIT3);
	CS1630_wr_buffer(CS1630_BANK1_PLL_CTL0, temp, 4); // 配置Bank1 的 PLL_CTL0为07  80  48

	CS1630_write_byte(CS1630_BANK1_DAC_RANGE, regval); // 恢复校准值，后续休眠唤醒后不用再次校准
	CS1630_Bank_Switch(RF_Bank0);

	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x01);
	/***********************************************************/
#endif

#if 1
	temp[0] = 0x34;
	temp[1] = get_rolling_code_0()+1;
	temp[2] = get_rolling_code_1()+1;
	temp[3] = get_rolling_code_2()+1;
	temp[4] = get_rolling_code_3()+1;
#endif
    CS1630_wr_buffer(CS1630_BANK0_TX_ADDR, temp, 5); // set address

//	CS1630_read_buffer(CS1630_BANK0_SETUP_AW, temp, 1);
//	temp[0] &= 0x03;
//	temp[0] |= BIT2;
//	CS1630_wr_buffer(CS1630_BANK0_SETUP_AW, temp, 1);

	CS1630_Clear_All_Irq();
	CS1630_Flush_Tx();
	CLRWDT();

}

void CS1630_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len)
{

	CS1630_CSN_LOW;
	SPI_SendByte(RF_R_REGISTER|addr);

	while(len--)
	{
		*buf++ = SPI_ReadByte();
	}
//    while (SPI_I2S_GetFlagStatus(CS1630_SPI, SPI_I2S_FLAG_BSY) == SET);
	delay_us(1);
	CS1630_CSN_HIGH;
}

/*Read One Register */
unsigned char CS1630_read_byte(unsigned char addr)
{
	unsigned char rxdata;

	CS1630_CSN_LOW;
	SPI_SendByte(RF_R_REGISTER|addr);
	rxdata = SPI_ReadByte();
	CS1630_CSN_HIGH;

	return(rxdata);
}

/*Write One Register*/
void CS1630_write_byte(unsigned char addr,unsigned char D)
{

	CS1630_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER|addr);
	SPI_SendByte(D);
	CS1630_CSN_HIGH;

}

void CS1630_wr_buffer(unsigned char addr, unsigned char* buf,unsigned char len)
{

	CS1630_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER|addr);
	while(len--)
	{
		SPI_SendByte(*buf++);
	}
	CS1630_CSN_HIGH;

}

/*write Commad  function, cmd = code; D = data*/
void CS1630_wr_cmd(unsigned char cmd,unsigned char D)
{
	CS1630_CSN_LOW;
	SPI_SendByte(cmd);
	SPI_SendByte(D);
	CS1630_CSN_HIGH;
}

/*write Commad  function, cmd = code; D = data*/
void CS1630_Bank_Switch(unsigned char bank)
{
	unsigned char sta;

	sta = CS1630_read_byte(CS1630_BANK0_STATUS);

	if(bank != RF_Bank0) // 切1
	{
		if(!(sta & RF_BANK0))
		{
		    CS1630_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
		}
	}
	else
	{
		if(sta & RF_BANK1) // 切0
		{
			CS1630_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
		}
	}
}

/*buf:data buffer; len:[1~32] ; cmd: HS6200_W_TX_PAYLOAD/HS6200_W_TX_PAYLOAD_NOACK*/
void CS1630_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len)
{
	unsigned char sta;

	sta = CS1630_read_byte(CS1630_BANK0_STATUS);
	if(!(sta&RF_STATUS_TX_FULL))
	{
		CS1630_wr_buffer(cmd, buf, len);
	}
}

void CS1630_ModeSwitch(RF_ModeTypeDef mod)
{
	unsigned char tmp;

	tmp = CS1630_read_byte(CS1630_BANK0_CONFIG);
	if(mod != Rf_PRX_Mode)
	{
		tmp &= 0xFE;
	}
	else
	{
		tmp |= 0x01;
	}
	CS1630_write_byte(CS1630_BANK0_CONFIG, tmp);

	if(mod == Rf_Carrier_Mode)
	{
		tmp = 0x80 | CS1630_read_byte(CS1630_BANK0_RF_SETUP);
		CS1630_write_byte(CS1630_BANK0_RF_SETUP, tmp);
	}
}

/*Clear All Irq*/
void CS1630_Clear_All_Irq(void)
{
	CS1630_write_byte(CS1630_BANK0_STATUS, 0x70);
}

/*Flush Tx*/
void CS1630_Flush_Tx(void)
{
	CS1630_CSN_LOW;
	SPI_SendByte(RF_FLUSH_TX);
	CS1630_CSN_HIGH;
}

void CS1630_Resend_Tx_Payload(void)
{
	CS1630_CSN_LOW;
	SPI_SendByte(RF_REUSE_TX_PL);
	CS1630_CSN_HIGH;
}

void CS1630_Reuse_Tx_Payload(void)
{
	CS1630_CSN_LOW;
	SPI_SendByte(RF_REUSE_TX_PL);
	CS1630_CSN_HIGH;
}

void CS1630_CE_High(void)
{
	unsigned char reg_val = 0;
//	RF_CE_HIGH;
	reg_val = CS1630_read_byte(CS1630_BANK0_SETUP_VALUE);
	reg_val |= BIT3;
	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, reg_val);
}

void CS1630_CE_Low(void)
{
//	RF_CE_LOW;
	unsigned char reg_val = 0;
	reg_val = CS1630_read_byte(CS1630_BANK0_SETUP_VALUE);
	reg_val &= ~BIT3;
	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, reg_val);
}

void Enter_sleep(void)
{
	unsigned char ret;

	/****************************************************************/

	ret = CS1630_read_byte(CS1630_BANK0_CONFIG);
	ret &= ~0x02;
	CS1630_CSN_LOW;
	SPI_SendByte(RF_W_REGISTER | CS1630_BANK0_CONFIG);
	SPI_SendByte(ret);

	IOSTB = C_PB5_Input;

	CS1630_CSN_HIGH;

	delay_us(10);
//	printf("\n wait for wakeup.\n");
	while(1 == RF_Reag_SDIO());
//	printf("\n wakeup.\n");
	CS1630_CSN_LOW;
	delay_us(10);
	CS1630_CSN_HIGH;
	IOSTB = C_PB5_Output;
	/****************************************************************/
}

/*-------------------------------------------End Of File---------------------------------------------*/
