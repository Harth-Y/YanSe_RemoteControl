//------------------------------------------------------------------------------------
// app_hs6230_test.c
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
#include "bsp_hs6230.h"
#include "bsp_delay.h"
#include "app_hs6230_test.h"

static unsigned char HS6230_Tx_Payload[32];

void send_rf_packet_test(unsigned char guard_en)
{
	unsigned int i = 0;
	unsigned char temp[4];

	HS6230_Init();
	HS6230_write_byte(HS6230_BANK0_RF_CH, 103);//0x05);

	HS6230_write_byte(HS6230_BANK0_FEATURE, 0x04);//0x07);
	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x02);//0x0f);
	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x02);
	HS6230_write_byte(HS6230_BANK0_SETUP_AW, 0x03);
	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x01);
	HS6230_write_byte(RF_BANK1_FDEV,0x20);
	HS6230_write_byte(HS6230_BANK0_RF_SETUP, 0x40);//0x40);

	HS6230_Bank_Switch(RF_Bank1);

	if(guard_en)
	{
			//printf("\r\npacket send start, please use nrfl2401 receive!\r\n");
			HS6230_read_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
			temp[2] &= ~0x02;  //scramble_en = 0
			temp[3] = 0;  ////by pass guard
			HS6230_wr_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
	}
	else
	{
			//printf("\r\npacket send start, please use hs6200 receive!\r\n");
			HS6230_read_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
			temp[2] |= 0x02;  //scramble_en = 0
			temp[3] = 0x01;  //// guard = 1
			HS6230_wr_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
  }
	HS6230_Bank_Switch(RF_Bank0);

//  HS6230_Dump_RF_Register();

	HS6230_CE_Low();
	HS6230_ModeSwitch(Rf_PTX_Mode);

	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x02);  //pwoer up
	delay_ms(4);                                 //wait clk done

	////////////////////////////////////////////////////

	for(i = 0;i < 32;i ++)//
	{
		HS6230_Tx_Payload[i] = i;
	}

	while(1)
	{
		HS6230_Flush_Tx();
		HS6230_Clear_All_Irq();

		HS6230_SendPack(RF_W_TX_PAYLOAD, HS6230_Tx_Payload, 32);
		HS6230_CE_High(); //ce pulse 20us
		delay_us(40);
//		delay_us(200);

		HS6230_CE_Low();
	}
}

#define AD_TYPE_MANUFACTURE_DATA     0xff
#define AD_TYPE_SHORT_LOCAL_NAME     0x08
#define AD_TYPE_COMPLETE_LOCAL_NAME  0x09
#define DEFAULT_MANUFACTURE_ID       0xFFF1

static const unsigned char channel_index[3] = {
	 2,  // 2.402G  // 37
	 26, // 2.426G  // 38
   80  // 2.480G  // 39
};

#if 1
void send_ble_packet_test(void)
{
	unsigned char i = 0;
	unsigned char idx = 0;
//	unsigned char j = 1;
	unsigned char len = 1;
	unsigned char status = 0x00;
//	unsigned char tmp[4] = {0x00};

	HS6230_Init();

	//printf("\r\npacket send start!\r\n");
	HS6230_CE_Low();
	HS6230_ModeSwitch(Rf_PTX_Mode);

	HS6230_write_byte(HS6230_BANK0_FEATURE, 0x04);
	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x04);//0x06);

	len = 0;
	HS6230_Tx_Payload[len ++] = 0x02;
	HS6230_Tx_Payload[len ++] = 0x01;
	HS6230_Tx_Payload[len ++] = 0x1a;
																		//								bit0: (OFF) LE Limited Discoverable Mode
																		//								bit 1 (ON) LE General Discoverable Mode
																		//   							bit 2 (OFF) BR/EDR Not Supported
																		//   							bit 3 (ON) Simultaneous LE and BR/EDR to Same Device Capable (controller)
																		//   							bit 4 (ON) Simultaneous LE and BR/EDR to Same Device Capable (Host)
	HS6230_Tx_Payload[len ++] = 0x1a;
	HS6230_Tx_Payload[len ++] = 0xff;
	HS6230_Tx_Payload[len ++] = 0x4c;
	HS6230_Tx_Payload[len ++] = 0x00;
	HS6230_Tx_Payload[len ++] = 0x02; // 0x02 Byte 0 of iBeacon advertisement indicator
	HS6230_Tx_Payload[len ++] = 0x15; // 0x15 Byte 1 of iBeacon advertisement indicator
	HS6230_Tx_Payload[len ++] = 0xb9; // iBeacon proximity uuid, b9-40-7f-30-f5-f8-46-6e-af-f9-25-55-6b-57-fe-6d
	HS6230_Tx_Payload[len ++] = 0x40;
	HS6230_Tx_Payload[len ++] = 0x7f;
	HS6230_Tx_Payload[len ++] = 0x30;
	HS6230_Tx_Payload[len ++] = 0xf5;
	HS6230_Tx_Payload[len ++] = 0xf8;
	HS6230_Tx_Payload[len ++] = 0x46;
	HS6230_Tx_Payload[len ++] = 0x6e;
	HS6230_Tx_Payload[len ++] = 0xaf;
	HS6230_Tx_Payload[len ++] = 0xf9;
	HS6230_Tx_Payload[len ++] = 0x25;
	HS6230_Tx_Payload[len ++] = 0x55;
	HS6230_Tx_Payload[len ++] = 0x6b;
	HS6230_Tx_Payload[len ++] = 0x57;
	HS6230_Tx_Payload[len ++] = 0xfe;
	HS6230_Tx_Payload[len ++] = 0x6d; // iBeacon proximity uuid
	HS6230_Tx_Payload[len ++] = 0x00; // 0x0001 major
	HS6230_Tx_Payload[len ++] = 0x01;
	HS6230_Tx_Payload[len ++] = 0x00; // 0x0001 minor
	HS6230_Tx_Payload[len ++] = 0x01;
	HS6230_Tx_Payload[len ++] = 0xc5; // 0xc5 calibrated Tx Power

	for(i = 0;i < 100;i ++)
	{
		HS6230_CE_Low();
		HS6230_Flush_Tx();
		HS6230_Clear_All_Irq();

		HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
		delay_ms(4);

		for(idx = 0;idx < 3;idx ++)
		{
			HS6230_write_byte(HS6230_BANK0_RF_CH, channel_index[idx]);
			HS6230_SendPack(RF_W_TX_PAYLOAD, HS6230_Tx_Payload, len);//HS6230_Tx_Payload[0] + 1);
			HS6230_CE_High(); //ce pulse 20us
			delay_us(40);
			HS6230_CE_Low();

			/*wait data send finished*/
			while(1)
			{
				status = HS6230_read_byte(HS6230_BANK0_STATUS);;
				if ((TX_DS&status) || (MAX_RT&status))
				{
					HS6230_write_byte(HS6230_BANK0_STATUS, status);
					break;
				}
			}
		}

		HS6230_write_byte(HS6230_BANK0_CONFIG, 0x00);
		delay_ms(1);

		for(char four_time = 0; four_time < 4; four_time++)
		delay_ms(250);//(25);
	}
}
#endif