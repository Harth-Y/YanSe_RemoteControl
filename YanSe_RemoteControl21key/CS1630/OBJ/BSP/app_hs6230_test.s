;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\app_hs6230_test.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delay_us
	extern	_delay_ms
	extern	_HS6230_Dump_RF_Register
	extern	_Enter_sleep
	extern	_HS6230_SendPack
	extern	_HS6230_wr_buffer
	extern	_HS6230_write_byte
	extern	_HS6230_read_byte
	extern	_HS6230_read_buffer
	extern	_HS6230_Bank_Switch
	extern	_HS6230_ModeSwitch
	extern	_HS6230_CE_Low
	extern	_HS6230_CE_High
	extern	_HS6230_Flush_Tx
	extern	_HS6230_Clear_All_Irq
	extern	_HS6230_Init
	extern	_HS6230_Soft_Rst
	extern	_SPI_ReadByte
	extern	_SPI_SendByte
	extern	_RF_softSPI_Init
	extern	_clear_ram
	extern	_multi_16b
	extern	_RF_Init
	extern	_RF_wr_cmd
	extern	_RF_write_byte
	extern	_RF_wr_buffer
	extern	_RF_Write_Ack_Payload
	extern	_RF_spi_wrd
	extern	_RF_Soft_Rst
	extern	_RF_SendPack
	extern	_RF_ReceivePack
	extern	_RF_Read_Status
	extern	_RF_read_byte
	extern	_RF_read_buffer
	extern	_RF_Operation
	extern	_RF_ModeSwitch
	extern	_RF_Get_RSSI
	extern	_RF_Get_Chip_ID
	extern	_RF_Flush_Tx
	extern	_RF_Flush_Rx
	extern	_RF_Configure_Reg
	extern	_RF_Clear_All_Irq
	extern	_RF_Change_Pwr
	extern	_RF_Change_CH
	extern	_RF_ChangeAddr_Reg
	extern	_RF_CE_Low
	extern	_RF_CE_High_Pulse
	extern	_RF_CE_High
	extern	_RF_Bank_Switch
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_PS0CV
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_PWM5RH
	extern	_PWM5DUTY
	extern	_P5CR1
	extern	_PWM4DUTY
	extern	_P4CR1
	extern	_PS3CV
	extern	_PWM3DUTY
	extern	_T3CR2
	extern	_T3CR1
	extern	_TMR3
	extern	_OSCCR
	extern	_PWM2DUTY
	extern	_P2CR1
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_TM34RH
	extern	_TMRH
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_INTE2bits
	extern	_RFCbits
	extern	_INTEDGbits
	extern	_AWUCONbits
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_ABPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits
	extern	__gptrget1

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern ___STK12
	extern STK11
	extern ___STK11
	extern STK10
	extern ___STK10
	extern STK09
	extern ___STK09
	extern STK08
	extern ___STK08
	extern STK07
	extern ___STK07
	extern STK06
	extern ___STK06
	extern STK05
	extern ___STK05
	extern STK04
	extern ___STK04
	extern STK03
	extern ___STK03
	extern STK02
	extern ___STK02
	extern STK01
	extern ___STK01
	extern STK00
	extern ___STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_INTE2
	extern	_RFC
	extern	_INTEDG
	extern	_AWUCON
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA
	extern	_send_rf_packet_test
	extern	_send_ble_packet_test

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_HS6230_Tx_Payload:
	.res 32
	.debuginfo complex-type (symbol "_HS6230_Tx_Payload" 32 local "BSP\app_hs6230_test.c" 18 (array 32 (basetype 1 unsigned)))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
_send_rf_packet_test_temp_65536_53:
	.res	4
	.debuginfo complex-type (symbol "_send_rf_packet_test_temp_65536_53" 4 global "" 0 (basetype 4 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "code"
_channel_index:
	retia 0x02	; 2
	retia 0x1a	; 26
	retia 0x50	; 80	'P'
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_app_hs6230_test	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _HS6230_Init
;   _HS6230_CE_Low
;   _HS6230_ModeSwitch
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_CE_Low
;   _HS6230_Flush_Tx
;   _HS6230_Clear_All_Irq
;   _HS6230_write_byte
;   _delay_ms
;   __gptrget1
;   _HS6230_write_byte
;   _HS6230_SendPack
;   _HS6230_CE_High
;   _delay_us
;   _HS6230_CE_Low
;   _HS6230_read_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _delay_ms
;   _delay_ms
;   _HS6230_Init
;   _HS6230_CE_Low
;   _HS6230_ModeSwitch
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_CE_Low
;   _HS6230_Flush_Tx
;   _HS6230_Clear_All_Irq
;   _HS6230_write_byte
;   _delay_ms
;   __gptrget1
;   _HS6230_write_byte
;   _HS6230_SendPack
;   _HS6230_CE_High
;   _delay_us
;   _HS6230_CE_Low
;   _HS6230_read_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _delay_ms
;   _delay_ms
;9 compiler assigned registers:
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   STK01
;   r0x1028
;   STK03
;   STK02
;; Starting pCode block
.segment "code"; module=app_hs6230_test, function=_send_ble_packet_test
	.debuginfo subprogram _send_ble_packet_test
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "BSP\app_hs6230_test.c" 99 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_hs6230_test.c" 100 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_hs6230_test.c" 103 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_four_time" 1 "BSP\app_hs6230_test.c" 185 (basetype 1 unsigned) split "r0x1025")
_send_ble_packet_test:
; 2 exit points
	.line	106, "BSP\app_hs6230_test.c"; 	HS6230_Init();
	MCALL	_HS6230_Init
	.line	109, "BSP\app_hs6230_test.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
	.line	110, "BSP\app_hs6230_test.c"; 	HS6230_ModeSwitch(Rf_PTX_Mode);
	MOVIA	0x01
	MCALL	_HS6230_ModeSwitch
	.line	112, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_FEATURE, 0x04);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1d
	MCALL	_HS6230_write_byte
	.line	113, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	114, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x04);//0x06);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_HS6230_write_byte
	.line	117, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x02;
	MOVIA	0x02
	BANKSEL	_HS6230_Tx_Payload
	MOVAR	(_HS6230_Tx_Payload + 0)
	.line	118, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x01;
	MOVIA	0x01
	MOVAR	(_HS6230_Tx_Payload + 1)
	.line	119, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x1a;
	MOVIA	0x1a
	MOVAR	(_HS6230_Tx_Payload + 2)
	.line	125, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x1a;
	MOVIA	0x1a
	MOVAR	(_HS6230_Tx_Payload + 3)
	.line	126, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xff;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 4)
	.line	127, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x4c;
	MOVIA	0x4c
	MOVAR	(_HS6230_Tx_Payload + 5)
	.line	128, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x00;
	CLRR	(_HS6230_Tx_Payload + 6)
	.line	129, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x02; // 0x02 Byte 0 of iBeacon advertisement indicator
	MOVIA	0x02
	MOVAR	(_HS6230_Tx_Payload + 7)
	.line	130, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x15; // 0x15 Byte 1 of iBeacon advertisement indicator
	MOVIA	0x15
	MOVAR	(_HS6230_Tx_Payload + 8)
	.line	131, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xb9; // iBeacon proximity uuid, b9-40-7f-30-f5-f8-46-6e-af-f9-25-55-6b-57-fe-6d
	MOVIA	0xb9
	MOVAR	(_HS6230_Tx_Payload + 9)
	.line	132, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x40;
	MOVIA	0x40
	MOVAR	(_HS6230_Tx_Payload + 10)
	.line	133, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x7f;
	MOVIA	0x7f
	MOVAR	(_HS6230_Tx_Payload + 11)
	.line	134, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x30;
	MOVIA	0x30
	MOVAR	(_HS6230_Tx_Payload + 12)
	.line	135, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xf5;
	MOVIA	0xf5
	MOVAR	(_HS6230_Tx_Payload + 13)
	.line	136, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xf8;
	MOVIA	0xf8
	MOVAR	(_HS6230_Tx_Payload + 14)
	.line	137, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x46;
	MOVIA	0x46
	MOVAR	(_HS6230_Tx_Payload + 15)
	.line	138, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x6e;
	MOVIA	0x6e
	MOVAR	(_HS6230_Tx_Payload + 16)
	.line	139, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xaf;
	MOVIA	0xaf
	MOVAR	(_HS6230_Tx_Payload + 17)
	.line	140, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xf9;
	MOVIA	0xf9
	MOVAR	(_HS6230_Tx_Payload + 18)
	.line	141, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x25;
	MOVIA	0x25
	MOVAR	(_HS6230_Tx_Payload + 19)
	.line	142, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x55;
	MOVIA	0x55
	MOVAR	(_HS6230_Tx_Payload + 20)
	.line	143, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x6b;
	MOVIA	0x6b
	MOVAR	(_HS6230_Tx_Payload + 21)
	.line	144, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x57;
	MOVIA	0x57
	MOVAR	(_HS6230_Tx_Payload + 22)
	.line	145, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xfe;
	MOVIA	0xfe
	MOVAR	(_HS6230_Tx_Payload + 23)
	.line	146, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x6d; // iBeacon proximity uuid
	MOVIA	0x6d
	MOVAR	(_HS6230_Tx_Payload + 24)
	.line	147, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x00; // 0x0001 major
	CLRR	(_HS6230_Tx_Payload + 25)
	.line	148, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x01;
	MOVIA	0x01
	MOVAR	(_HS6230_Tx_Payload + 26)
	.line	149, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x00; // 0x0001 minor
	CLRR	(_HS6230_Tx_Payload + 27)
	.line	150, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0x01;
	MOVIA	0x01
	MOVAR	(_HS6230_Tx_Payload + 28)
	.line	151, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[len ++] = 0xc5; // 0xc5 calibrated Tx Power
	MOVIA	0xc5
	MOVAR	(_HS6230_Tx_Payload + 29)
	.line	153, "BSP\app_hs6230_test.c"; 	for(i = 0;i < 100;i ++)
	BANKSEL	r0x1024
	CLRR	r0x1024
_02031_DS_:
	.line	155, "BSP\app_hs6230_test.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
	.line	156, "BSP\app_hs6230_test.c"; 	HS6230_Flush_Tx();
	MCALL	_HS6230_Flush_Tx
	.line	157, "BSP\app_hs6230_test.c"; 	HS6230_Clear_All_Irq();
	MCALL	_HS6230_Clear_All_Irq
	.line	159, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	160, "BSP\app_hs6230_test.c"; 	delay_ms(4);
	MOVIA	0x04
	MCALL	_delay_ms
	.line	162, "BSP\app_hs6230_test.c"; 	for(idx = 0;idx < 3;idx ++)
	BANKSEL	r0x1025
	CLRR	r0x1025
_02026_DS_:
	.line	164, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_RF_CH, channel_index[idx]);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_HS6230_write_byte
	.line	165, "BSP\app_hs6230_test.c"; 	HS6230_SendPack(RF_W_TX_PAYLOAD, HS6230_Tx_Payload, len);//HS6230_Tx_Payload[0] + 1);
	MOVIA	(_HS6230_Tx_Payload + 0)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	MOVIA	0x1e
	MOVAR	STK03
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK02
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_HS6230_SendPack
	.line	166, "BSP\app_hs6230_test.c"; 	HS6230_CE_High(); //ce pulse 20us
	MCALL	_HS6230_CE_High
	.line	167, "BSP\app_hs6230_test.c"; 	delay_us(40);
	MOVIA	0x28
	MCALL	_delay_us
	.line	168, "BSP\app_hs6230_test.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
_02021_DS_:
	.line	173, "BSP\app_hs6230_test.c"; 	status = HS6230_read_byte(HS6230_BANK0_STATUS);;
	MOVIA	0x07
	MCALL	_HS6230_read_byte
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	174, "BSP\app_hs6230_test.c"; 	if ((TX_DS&status) || (MAX_RT&status))
	BTRSC	r0x1026,5
	MGOTO	_02017_DS_
	BTRSS	r0x1026,4
	MGOTO	_02021_DS_
_02017_DS_:
	.line	176, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_STATUS, status);
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_HS6230_write_byte
	.line	162, "BSP\app_hs6230_test.c"; 	for(idx = 0;idx < 3;idx ++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1025,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	182, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	183, "BSP\app_hs6230_test.c"; 	delay_ms(1);
	MOVIA	0x01
	MCALL	_delay_ms
	.line	185, "BSP\app_hs6230_test.c"; 	for(char four_time = 0; four_time < 4; four_time++)
	BANKSEL	r0x1025
	CLRR	r0x1025
;;unsigned compare: left < lit(0x4=4), size=1
_02029_DS_:
	MOVIA	0x04
	BANKSEL	r0x1025
	SUBAR	r0x1025,W
	BTRSC	STATUS,0
	MGOTO	_02032_DS_
	.line	186, "BSP\app_hs6230_test.c"; 	delay_ms(250);//(25);
	MOVIA	0xfa
	MCALL	_delay_ms
	.line	185, "BSP\app_hs6230_test.c"; 	for(char four_time = 0; four_time < 4; four_time++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
	MGOTO	_02029_DS_
_02032_DS_:
	.line	153, "BSP\app_hs6230_test.c"; 	for(i = 0;i < 100;i ++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
;;unsigned compare: left < lit(0x64=100), size=1
	MOVIA	0x64
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	MGOTO	_02031_DS_
	.line	188, "BSP\app_hs6230_test.c"; 	}
	RETURN	
; exit point of _send_ble_packet_test

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _HS6230_Init
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_Bank_Switch
;   _HS6230_read_buffer
;   _HS6230_wr_buffer
;   _HS6230_read_buffer
;   _HS6230_wr_buffer
;   _HS6230_Bank_Switch
;   _HS6230_CE_Low
;   _HS6230_ModeSwitch
;   _HS6230_write_byte
;   _delay_ms
;   _HS6230_Flush_Tx
;   _HS6230_Clear_All_Irq
;   _HS6230_SendPack
;   _HS6230_CE_High
;   _delay_us
;   _HS6230_CE_Low
;   _HS6230_Init
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _HS6230_Bank_Switch
;   _HS6230_read_buffer
;   _HS6230_wr_buffer
;   _HS6230_read_buffer
;   _HS6230_wr_buffer
;   _HS6230_Bank_Switch
;   _HS6230_CE_Low
;   _HS6230_ModeSwitch
;   _HS6230_write_byte
;   _delay_ms
;   _HS6230_Flush_Tx
;   _HS6230_Clear_All_Irq
;   _HS6230_SendPack
;   _HS6230_CE_High
;   _delay_us
;   _HS6230_CE_Low
;8 compiler assigned registers:
;   r0x1029
;   STK00
;   r0x102A
;   r0x102B
;   STK03
;   STK02
;   STK01
;   r0x102C
;; Starting pCode block
.segment "code"; module=app_hs6230_test, function=_send_rf_packet_test
	.debuginfo subprogram _send_rf_packet_test
;local variable name mapping:
	.debuginfo complex-type (local-sym "_guard_en" 1 "BSP\app_hs6230_test.c" 20 (basetype 1 unsigned) split "r0x1029")
	.debuginfo complex-type (local-sym "_temp" 4 "BSP\app_hs6230_test.c" 23 (array 4 (basetype 1 unsigned)) link "_send_rf_packet_test_temp_65536_53")
	.debuginfo complex-type (local-sym "_i" 2 "BSP\app_hs6230_test.c" 22 (basetype 2 unsigned) split "r0x1029" "r0x102A")
_send_rf_packet_test:
; 2 exit points
	.line	20, "BSP\app_hs6230_test.c"; 	void send_rf_packet_test(unsigned char guard_en)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	25, "BSP\app_hs6230_test.c"; 	HS6230_Init();
	MCALL	_HS6230_Init
	.line	26, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_RF_CH, 103);//0x05);
	MOVIA	0x67
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_HS6230_write_byte
	.line	28, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_FEATURE, 0x04);//0x07);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1d
	MCALL	_HS6230_write_byte
	.line	29, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x02);//0x0f);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	30, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x02);
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_HS6230_write_byte
	.line	31, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_SETUP_AW, 0x03);
	MOVIA	0x03
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_HS6230_write_byte
	.line	32, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x01);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_HS6230_write_byte
	.line	33, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(RF_BANK1_FDEV,0x20);
	MOVIA	0x20
	MOVAR	STK00
	MOVIA	0x0c
	MCALL	_HS6230_write_byte
	.line	34, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_RF_SETUP, 0x40);//0x40);
	MOVIA	0x40
	MOVAR	STK00
	MOVIA	0x06
	MCALL	_HS6230_write_byte
	.line	36, "BSP\app_hs6230_test.c"; 	HS6230_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_HS6230_Bank_Switch
	.line	38, "BSP\app_hs6230_test.c"; 	if(guard_en)
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BTRSC	STATUS,2
	MGOTO	_02006_DS_
	.line	41, "BSP\app_hs6230_test.c"; 	HS6230_read_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
	MOVIA	(_send_rf_packet_test_temp_65536_53 + 0)
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_HS6230_read_buffer
	.line	42, "BSP\app_hs6230_test.c"; 	temp[2] &= ~0x02;  //scramble_en = 0
	BANKSEL	_send_rf_packet_test_temp_65536_53
	MOVR	(_send_rf_packet_test_temp_65536_53 + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BCR	r0x1029,1
	MOVR	r0x1029,W
	BANKSEL	_send_rf_packet_test_temp_65536_53
	MOVAR	(_send_rf_packet_test_temp_65536_53 + 2)
	.line	43, "BSP\app_hs6230_test.c"; 	temp[3] = 0;  ////by pass guard
	CLRR	(_send_rf_packet_test_temp_65536_53 + 3)
	.line	44, "BSP\app_hs6230_test.c"; 	HS6230_wr_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
	MOVIA	(_send_rf_packet_test_temp_65536_53 + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_HS6230_wr_buffer
	MGOTO	_02007_DS_
_02006_DS_:
	.line	49, "BSP\app_hs6230_test.c"; 	HS6230_read_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
	MOVIA	(_send_rf_packet_test_temp_65536_53 + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_HS6230_read_buffer
	.line	50, "BSP\app_hs6230_test.c"; 	temp[2] |= 0x02;  //scramble_en = 0
	BANKSEL	_send_rf_packet_test_temp_65536_53
	MOVR	(_send_rf_packet_test_temp_65536_53 + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BSR	r0x1029,1
	MOVR	r0x1029,W
	BANKSEL	_send_rf_packet_test_temp_65536_53
	MOVAR	(_send_rf_packet_test_temp_65536_53 + 2)
	.line	51, "BSP\app_hs6230_test.c"; 	temp[3] = 0x01;  //// guard = 1
	MOVIA	0x01
	MOVAR	(_send_rf_packet_test_temp_65536_53 + 3)
	.line	52, "BSP\app_hs6230_test.c"; 	HS6230_wr_buffer(HS6230_BANK1_FAGC_CTRL, temp, 4);
	MOVIA	(_send_rf_packet_test_temp_65536_53 + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x03
	MCALL	_HS6230_wr_buffer
_02007_DS_:
	.line	54, "BSP\app_hs6230_test.c"; 	HS6230_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_HS6230_Bank_Switch
	.line	58, "BSP\app_hs6230_test.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
	.line	59, "BSP\app_hs6230_test.c"; 	HS6230_ModeSwitch(Rf_PTX_Mode);
	MOVIA	0x01
	MCALL	_HS6230_ModeSwitch
	.line	61, "BSP\app_hs6230_test.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x02);  //pwoer up
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	62, "BSP\app_hs6230_test.c"; 	delay_ms(4);                                 //wait clk done
	MOVIA	0x04
	MCALL	_delay_ms
	.line	66, "BSP\app_hs6230_test.c"; 	for(i = 0;i < 32;i ++)//
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
_02012_DS_:
	.line	68, "BSP\app_hs6230_test.c"; 	HS6230_Tx_Payload[i] = i;
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	ADDIA	(_HS6230_Tx_Payload + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	FSR
	BCR	STATUS,6
	BTRSC	FSR,7
	BSR	STATUS,6
	MOVR	STK00,W
	MOVAR	INDF
	.line	66, "BSP\app_hs6230_test.c"; 	for(i = 0;i < 32;i ++)//
	BANKSEL	r0x1029
	INCR	r0x1029,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x102A
	INCR	r0x102A,F
;;unsigned compare: left < lit(0x20=32), size=2
_00001_DS_:
	MOVIA	0x20
	BANKSEL	r0x1029
	SUBAR	r0x1029,W
	MOVIA	0x00
	BANKSEL	r0x102A
	SBCAR	r0x102A,W
	BTRSS	STATUS,0
	MGOTO	_02012_DS_
_02010_DS_:
	.line	73, "BSP\app_hs6230_test.c"; 	HS6230_Flush_Tx();
	MCALL	_HS6230_Flush_Tx
	.line	74, "BSP\app_hs6230_test.c"; 	HS6230_Clear_All_Irq();
	MCALL	_HS6230_Clear_All_Irq
	.line	76, "BSP\app_hs6230_test.c"; 	HS6230_SendPack(RF_W_TX_PAYLOAD, HS6230_Tx_Payload, 32);
	MOVIA	(_HS6230_Tx_Payload + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x20
	MOVAR	STK03
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK02
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_HS6230_SendPack
	.line	77, "BSP\app_hs6230_test.c"; 	HS6230_CE_High(); //ce pulse 20us
	MCALL	_HS6230_CE_High
	.line	78, "BSP\app_hs6230_test.c"; 	delay_us(40);
	MOVIA	0x28
	MCALL	_delay_us
	.line	81, "BSP\app_hs6230_test.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
	MGOTO	_02010_DS_
	.line	83, "BSP\app_hs6230_test.c"; 	}
	RETURN	
; exit point of _send_rf_packet_test


;	code size estimation:
;	  324+   70 =   394 instructions (  928 byte)

	end
