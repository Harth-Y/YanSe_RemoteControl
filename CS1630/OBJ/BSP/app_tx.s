;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\app_tx.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delay_40us
	extern	_delay_us
	extern	_delay_250ms
	extern	_delay_ms
	extern	_CS1630_Dump_RF_Register
	extern	_Enter_sleep
	extern	_CS1630_SendPack
	extern	_CS1630_wr_buffer
	extern	_CS1630_write_byte
	extern	_CS1630_read_byte
	extern	_CS1630_read_buffer
	extern	_CS1630_Bank_Switch
	extern	_CS1630_ModeSwitch
	extern	_CS1630_CE_Low
	extern	_CS1630_CE_High
	extern	_CS1630_Flush_Tx
	extern	_CS1630_Clear_All_Irq
	extern	_CS1630_Init
	extern	_CS1630_Soft_Rst
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
	extern	_send_ble_packet

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_CS1630_Tx_Payload:
	.debuginfo complex-type (symbol "_CS1630_Tx_Payload" 32 local "BSP\app_tx.c" 7 (array 32 (basetype 1 unsigned)))

	dw	0x02	; 2
	dw	0x01	; 1
	dw	0x06	; 6
	dw	0x10	; 16
	dw	0xff	; 255
	dw	0x54	; 84	'T'
	dw	0x45	; 69	'E'
	dw	0x00	; 0
	dw	0x00	; 0
	dw	0xbf	; 191
	dw	0xaa	; 170
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0xff	; 255
	dw	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00


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
; code_app_tx	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_CE_Low
;   _CS1630_Flush_Tx
;   _CS1630_Clear_All_Irq
;   _CS1630_write_byte
;   _delay_ms
;   __gptrget1
;   _CS1630_write_byte
;   _CS1630_SendPack
;   _CS1630_CE_High
;   _delay_40us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_write_byte
;   __gptrget1
;   _CS1630_write_byte
;   _CS1630_SendPack
;   _CS1630_CE_High
;   _delay_40us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _delay_ms
;   _CS1630_CE_Low
;   _CS1630_Flush_Tx
;   _CS1630_Clear_All_Irq
;   _CS1630_write_byte
;   _delay_ms
;   __gptrget1
;   _CS1630_write_byte
;   _CS1630_SendPack
;   _CS1630_CE_High
;   _delay_40us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_write_byte
;   __gptrget1
;   _CS1630_write_byte
;   _CS1630_SendPack
;   _CS1630_CE_High
;   _delay_40us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _delay_ms
;10 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK01
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   STK03
;   STK02
;; Starting pCode block
.segment "code"; module=app_tx, function=_send_ble_packet
	.debuginfo subprogram _send_ble_packet
;local variable name mapping:
	.debuginfo complex-type (local-sym "_code_value" 1 "BSP\app_tx.c" 35 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_keydown_times" 1 "BSP\app_tx.c" 35 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_s_data_num" 1 "BSP\app_tx.c" 35 (basetype 1 unsigned) split "r0x1022")
	.debuginfo complex-type (local-sym "_k" 1 "BSP\app_tx.c" 41 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_tx.c" 42 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\app_tx.c" 39 (basetype 1 unsigned) split "r0x1022")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_tx.c" 43 (basetype 1 unsigned) split "r0x1023")
_send_ble_packet:
; 2 exit points
	.line	35, "BSP\app_tx.c"; 	void send_ble_packet(unsigned char code_value, unsigned char keydown_times, unsigned char s_data_num)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK01,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	37, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	38, "BSP\app_tx.c"; 	PB4 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,4
	.line	46, "BSP\app_tx.c"; 	CS1630_Tx_Payload[7] = s_data_num; // 序号，用于区分不同数据包
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 7)
	.line	47, "BSP\app_tx.c"; 	CS1630_Tx_Payload[8] = code_value; // 码值，用于指示功能
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 8)
	.line	50, "BSP\app_tx.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
	.line	51, "BSP\app_tx.c"; 	CS1630_Flush_Tx();
	MCALL	_CS1630_Flush_Tx
	.line	52, "BSP\app_tx.c"; 	CS1630_Clear_All_Irq();
	MCALL	_CS1630_Clear_All_Irq
	.line	55, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	56, "BSP\app_tx.c"; 	delay_ms(5);
	MOVIA	0x05
	MCALL	_delay_ms
	.line	57, "BSP\app_tx.c"; 	if(keydown_times)
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_02050_DS_
	.line	60, "BSP\app_tx.c"; 	for(k =0; k < 2; k++)
	BANKSEL	r0x1020
	CLRR	r0x1020
_02029_DS_:
	.line	62, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	64, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_02027_DS_:
	.line	66, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	67, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK01
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	68, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1022
	CLRR	r0x1022
_02025_DS_:
	.line	70, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK02
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	71, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	72, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	73, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02009_DS_:
	.line	77, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	78, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1023,5
	MGOTO	_02005_DS_
	BTRSS	r0x1023,4
	MGOTO	_02009_DS_
_02005_DS_:
	.line	80, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	68, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1022,W
	BTRSS	STATUS,0
	MGOTO	_02025_DS_
	.line	64, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	MGOTO	_02027_DS_
	.line	60, "BSP\app_tx.c"; 	for(k =0; k < 2; k++)
	BANKSEL	r0x1020
	INCR	r0x1020,F
;;unsigned compare: left < lit(0x2=2), size=1
	MOVIA	0x02
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	MGOTO	_02029_DS_
	MGOTO	_02024_DS_
_02050_DS_:
	.line	91, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1020
	CLRR	r0x1020
_02033_DS_:
	.line	93, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	94, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK01
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	95, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_02031_DS_:
	.line	97, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1023
	CLRR	r0x1023
	BANKSEL	r0x1024
	CLRR	r0x1024
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	98, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	99, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	100, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02018_DS_:
	.line	104, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	105, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1022,5
	MGOTO	_02014_DS_
	BTRSS	r0x1022,4
	MGOTO	_02018_DS_
_02014_DS_:
	.line	107, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	95, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	MGOTO	_02031_DS_
	.line	91, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1020
	INCR	r0x1020,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1020,W
	BTRSS	STATUS,0
	MGOTO	_02033_DS_
_02024_DS_:
	.line	115, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	116, "BSP\app_tx.c"; 	delay_ms(1);
	MOVIA	0x01
	MCALL	_delay_ms
	.line	117, "BSP\app_tx.c"; 	PB4=0;
	BANKSEL	_PORTB
	BCR	_PORTB,4
	.line	118, "BSP\app_tx.c"; 	}
	RETURN	
; exit point of _send_ble_packet


;	code size estimation:
;	  151+   48 =   199 instructions (  494 byte)

	end
