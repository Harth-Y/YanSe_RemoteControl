//------------------------------------------------------------------------------------
// bsp_rf.c
//------------------------------------------------------------------------------------
// Copyright 2019, HunterSun Electronics Co., Ltd.
// crazy_code@yeah.net
// 2019-07-17
//
// Program Description:
//
//
//

#include "bsp_rf.h"
#include "bsp_delay.h"
#include "bsp_spi.h"

//#define Delay1ms(n)      delay_ms(n)
//#define Delay10ms(n)     delay_ms(10*n)

#define RF_CSN_HIGH	        PORTAbits.RF_CSN_PIN = 1;
#define RF_CSN_LOW          PORTAbits.RF_CSN_PIN = 0;

const unsigned char RF_Tx_Power[8][5] =
{
	//Bank0           Bank1
	//RF_SETUP     RF_IVGEN
	{0x00,0x9F,0x64,0x00,0x01},//-43dBm
	{0x00,0x1F,0x64,0x00,0x01},//-16dBm
	{0x01,0x9F,0x64,0x00,0x01},//-12dBm
	{0x01,0x1F,0x64,0x00,0x01},//-6dBm

	{0x03,0x1F,0x64,0x00,0x01},//0dBm
	{0x07,0x9F,0x64,0x00,0x01},//4dBm
	{0x40,0x1F,0x64,0x00,0x01},//5dBm
	{0x47,0x1F,0x64,0x00,0x01} //8dBm
};

/* Switch register Bank*/
/**
 * @brief 切换射频模块的寄存器组
 * @param bank: 要切换到的寄存器组类型，RF_BANK0 或 RF_BANK1
 * @return 无
 */
void RF_Bank_Switch(RF_Bank_TypeDef bank)
{
    unsigned char sta;

    // 读取 BANK0 状态寄存器的值
    sta = RF_read_byte(RF_BANK0_STATUS);

    if(bank!= RF_BANK0)
    {
        // 若要切换到 BANK1，且当前 BANK1 未被激活
        if(!(sta & RF_BANK1))
        {
            // 发送激活 BANK1 命令
            RF_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
        }
    }
    else
    {
        // 若要切换回 BANK0，且当前 BANK1 被激活
        if(sta & RF_BANK1)
        {
            // 发送激活 BANK1 命令，以便切换回 BANK0
            RF_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
        }
    }
}

/*Caution: Before calling the 'HS6206_ChangeAddr_Reg', */
/*              you should pull down the CE pin, using 'HS6206_CE_Low'*/
void RF_ChangeAddr_Reg(unsigned char* AddrBuf,unsigned char len)
{
	RF_wr_buffer(RF_BANK0_RX_ADDR_P0, AddrBuf, len);
	RF_wr_buffer(RF_BANK0_TX_ADDR, AddrBuf,len);
}

/*change the channel*/
/*Caution: Before calling the function 'HS6206_Change_CH', */
/*              you must pull down the CE pin, just call the               */
/*              function HS6206_CE_Low()                                 */

void RF_Change_CH(unsigned char ch_index)
{
	RF_write_byte(RF_BANK0_RF_CH, ch_index);
}

/*RF Tx changes itself transmitting power*/
/*Caution: Before calling the 'HS6206_Change_Pwr', */
/*              you should pull down the CE pin, using HS6206_CE_Low()*/
void RF_Change_Pwr(signed char Pwr_dBm)
{
	unsigned char	Pwr_Sel;

	switch(Pwr_dBm)
	{
		case -43:
			Pwr_Sel = 0;
			break;

		case -16:
			Pwr_Sel = 1;
			break;

		case -12:
			Pwr_Sel = 2;
			break;

		case -6:
			Pwr_Sel = 3;
			break;

		case  0:
			Pwr_Sel = 4;
			break;

		case  4:
			Pwr_Sel = 5;
			break;

		case  5:
			Pwr_Sel = 6;
			break;

		case  8:
			Pwr_Sel = 7;
			break;

		default:
			Pwr_Sel = 4;
			break;
	}

	RF_Bank_Switch(RF_Bank1);
	RF_wr_buffer(RF_BANK1_RF_IVGEN, &RF_Tx_Power[Pwr_Sel][1], 4);
	RF_Bank_Switch(RF_Bank0);
	RF_write_byte(RF_BANK0_RF_SETUP, RF_Tx_Power[Pwr_Sel][0]);
}

/*Clear All Irq*/
void RF_Clear_All_Irq(void)
{
	RF_write_byte(RF_BANK0_STATUS, 0x70);
}

/*Configuration Reg*/
void RF_Configure_Reg(const unsigned char* Dbuf)
{
	unsigned char cnt = 0;
	unsigned char Reg_Addr;
	unsigned char data_lenth;
	const unsigned char *p_data;

	while(1)
	{
		/*Get Reg_Addr*/
		Reg_Addr = Dbuf[cnt];
		if(0xFF == Reg_Addr)
		{
			break;	/*Reg_Addr Error,configuration is complete,break*/
		}

		/*Get Data_Lenth*/
		cnt += 1;
		data_lenth = Dbuf[cnt];

		/*Get Data address*/
		cnt += 1;
		p_data = &Dbuf[cnt];

		/*Write buffer*/
		RF_wr_buffer(Reg_Addr, p_data, data_lenth);
		cnt += data_lenth;
	}
}

/*Flush Rx*/
void RF_Flush_Rx(void)
{
	RF_Operation(RF_FLUSH_RX);
}

/*Flush Tx*/
void RF_Flush_Tx(void)
{
	RF_Operation(RF_FLUSH_TX);
}

unsigned char RF_Get_Chip_ID(void)
{
	unsigned char ReadArr[2];

	#ifdef HS6207_DEVICE
	RF_Bank_Switch(RF_Bank1);
	RF_read_buffer(RF_BANK1_LINE, ReadArr, 2);
	#endif

	#ifdef HS6206_DEVICE
		#ifdef _HS6206_USE_FPGA_
		RF_Bank_Switch(RF_Bank1);
		RF_read_buffer(RF_BANK1_LINE, ReadArr, 2);
		#else
		ReadArr[0] = CIDH;
		ReadArr[1] = CIDL;
		#endif
	#endif

	//printf("CID = %x %x\r\n",ReadArr[1], ReadArr[0]);
	return ReadArr[1];
}

/*get RSSI*/
/*Caution: To get the value of the RSSI, you should ensure that */
/*              the RF is in Rx mode and the CE pin is high.*/
signed char RF_Get_RSSI(void)
{
	unsigned char ReadArr;

	RF_Bank_Switch(RF_Bank0);
	ReadArr = RF_read_byte(RF_BANK0_RPD);

	return ((signed char)ReadArr);
}

/*Mode_Switch*/
/*Caution: Before calling the function 'HS6206_ModeSwitch', */
/*              you must pull down the CE pin, just call the              */
/*              function HS6206_CE_Low()                                */
void RF_ModeSwitch(RF_ModeTypeDef mod)
{
	unsigned char tmp;

	tmp = RF_read_byte(RF_BANK0_CONFIG);
	if(mod != Rf_PRX_Mode)
	{
		tmp &= 0xFE;
	}
	else
	{
		tmp |= 0x01;
	}
	RF_write_byte(RF_BANK0_CONFIG, tmp);

	if(mod == Rf_Carrier_Mode)
	{
		tmp = 0x80 | RF_read_byte(RF_BANK0_RF_SETUP);
		RF_write_byte(RF_BANK0_RF_SETUP, tmp);
	}
}

/*Operation Commad  function*/
unsigned char RF_Operation(unsigned char opt)
{
	unsigned char status;

	RF_CSN_LOW;
	status = RF_spi_wrd(opt);
	RF_CSN_HIGH;
	return status;
}

void RF_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len)
{
	RF_CSN_LOW;
	RF_spi_wrd(RF_R_REGISTER | addr);

	while(len--)
	{
		*buf++ = RF_spi_wrd(0);
	}
//    while (SPI_I2S_GetFlagStatus(RF_SPI, SPI_I2S_FLAG_BSY) == SET);
	delay_us(1);
	RF_CSN_HIGH;
}

/*Read One Register */
unsigned char RF_read_byte(unsigned char addr)
{
	unsigned char rxdata;

	RF_CSN_LOW;
	RF_spi_wrd(RF_R_REGISTER|addr);
	rxdata = RF_spi_wrd(0);
	RF_CSN_HIGH;

	return(rxdata);
}

/*read status*/
unsigned char RF_Read_Status(void)
{
	unsigned char status;
	status = RF_Operation(RF_READ_STATUS);

	return status;
}

/*buf:data read from rx buffer*/
unsigned char RF_ReceivePack(unsigned char* buf)
{
	unsigned char sta;
	unsigned char fifo_sta;
	unsigned char len;

	sta = RF_Read_Status();

	if(RF_STATUS_RX_DR & sta)
	{
		do
		{
			len = RF_read_byte(RF_R_RX_PL_WID);

			if(len <= RF_FIFO_MAX_PACK_SIZE)
			{
				RF_read_buffer(RF_R_RX_PAYLOAD, buf, len);
			}
			else
			{
				RF_Flush_Rx();
			}

			fifo_sta = RF_read_byte(RF_BANK0_FIFO_STATUS);

			//printf("RX received data = %d, %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\r\n",len,buf[0],buf[1],buf[2],buf[3],buf[4],buf[5],buf[6],buf[7],buf[8],buf[9],buf[10],buf[11],buf[12],buf[13],buf[14],buf[15],buf[16],buf[17],buf[18],buf[19],buf[20],buf[21],buf[22],buf[23],buf[24],buf[25],buf[26],buf[27],buf[28],buf[29],buf[30],buf[31]);
		}while(!(fifo_sta & RF_FIFO_STA_RX_EMPTY));/*not empty continue read out*/

		RF_write_byte(RF_BANK0_STATUS, sta);/*clear irq*/
		return len;
	}

	if(sta & (RF_STATUS_RX_DR | RF_STATUS_TX_DS | RF_STATUS_MAX_RT))
	{
		RF_write_byte(RF_BANK0_STATUS, sta);/*clear irq*/
	}

	return 0;
}

/*buf:data buffer; len:[1~32] ; cmd: HS6200_W_TX_PAYLOAD/HS6200_W_TX_PAYLOAD_NOACK*/
void RF_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len)
{
	unsigned char sta;

	sta = RF_Read_Status();
	if(!(sta&RF_STATUS_TX_FULL))
	{
		RF_wr_buffer(cmd, buf, len);
	}
}

void RF_Soft_Rst(void)
{
	unsigned char soft_temp[4];
	RF_Bank_Switch(RF_Bank1);

	RF_read_buffer(RF_BANK1_PLL_CTL1, soft_temp, 4);
	soft_temp[3] |= 0x80;
	RF_wr_buffer(RF_BANK1_PLL_CTL1, soft_temp, 4);
}

/*set Auto_ACK msg*/
void RF_Write_Ack_Payload(unsigned char PipeNum, unsigned char *pBuf, unsigned char bytes)
{
	unsigned char byte_ctr;

	RF_CSN_LOW;   //����
	RF_spi_wrd(RF_W_ACK_PAYLOAD | PipeNum);
	for(byte_ctr = 0; byte_ctr < bytes; byte_ctr++)	   // then write all byte in buffer(*pBuf)
	{
    RF_spi_wrd(*pBuf++);
	}
  RF_CSN_HIGH;
}

void RF_wr_buffer(unsigned char addr,const unsigned char* buf,unsigned char len)
{
	RF_CSN_LOW;
	RF_spi_wrd(RF_W_REGISTER|addr);
	while(len--)
	{
		RF_spi_wrd(*buf++);
	}
	RF_CSN_HIGH;
}

/*Write One Register*/
void RF_write_byte(unsigned char addr,unsigned char D)
{
	RF_CSN_LOW;
	RF_spi_wrd(RF_W_REGISTER|addr);
	RF_spi_wrd(D);
	RF_CSN_HIGH;
}

/*write Commad  function, cmd = code; D = data*/
/**
 * @brief 向射频模块写入命令
 * @param cmd: 要写入的命令
 * @param D: 与命令一起写入的数据（如果需要）
 * @return 无
 */
void RF_wr_cmd(unsigned char cmd, unsigned char D)
{
    // 拉低片选信号，选中射频模块
    RF_CSN_LOW;

    // 通过SPI接口写入命令
    RF_spi_wrd(cmd);

    // 如果有数据要写，通过SPI接口写入数据
    if (D!= 0)
    {
        RF_spi_wrd(D);
    }

    // 写完后拉高片选信号，结束通信
    RF_CSN_HIGH;
}

/* change Xtal_cc , this value is according to the board*/
void RF_ChangeCC(unsigned char cc)
{
  unsigned char reg_val;
	RF_Bank_Switch(RF_Bank1);
    reg_val = RF_read_byte(RF_BANK1_RF_IVGEN);
    reg_val &= ~0x1f;
    reg_val |= (cc & 0x1f);
    RF_write_byte(RF_BANK1_RF_IVGEN, reg_val);
	RF_Bank_Switch(RF_Bank0);
}

/*-------------------------------------------End Of File---------------------------------------------*/
