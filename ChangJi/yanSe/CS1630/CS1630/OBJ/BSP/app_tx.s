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
.segment "uninit"
r0x1026:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_CS1630_Tx_Payload:
	.debuginfo complex-type (symbol "_CS1630_Tx_Payload" 32 local "BSP\app_tx.c" 6 (array 32 (basetype 1 unsigned)))

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


.segment "idata"
_s_data_num:
	.debuginfo complex-type (symbol "_s_data_num" 1 local "BSP\app_tx.c" 33 (basetype 1 unsigned))

	dw	0x00	; 0


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
;   _CS1630_Init
;   _CS1630_CE_Low
;   _CS1630_ModeSwitch
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
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
;   _CS1630_write_byte
;   _delay_ms
;   _CS1630_Init
;   _CS1630_CE_Low
;   _CS1630_ModeSwitch
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
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
;   _CS1630_write_byte
;   _delay_ms
;10 compiler assigned registers:
;   r0x1021
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;   STK01
;   r0x1025
;   r0x1026
;   STK03
;   STK02
;; Starting pCode block
.segment "code"; module=app_tx, function=_send_ble_packet
	.debuginfo subprogram _send_ble_packet
;local variable name mapping:
	.debuginfo complex-type (local-sym "_code_value" 1 "BSP\app_tx.c" 34 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_k" 1 "BSP\app_tx.c" 38 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_tx.c" 39 (basetype 1 unsigned) split "r0x1022")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\app_tx.c" 36 (basetype 1 unsigned) split "r0x1023")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_tx.c" 40 (basetype 1 unsigned) split "r0x1024")
_send_ble_packet:
; 2 exit points
	.line	34, "BSP\app_tx.c"; 	void send_ble_packet(unsigned char code_value)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	41, "BSP\app_tx.c"; 	s_data_num++;
	BANKSEL	_s_data_num
	INCR	_s_data_num,F
	.line	42, "BSP\app_tx.c"; 	CS1630_Init(); // 初始化CS1630模块
	MCALL	_CS1630_Init
	.line	43, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 设置CE引脚为低电平，准备发送数据
	MCALL	_CS1630_CE_Low
	.line	44, "BSP\app_tx.c"; 	CS1630_ModeSwitch(Rf_PTX_Mode); // 切换到发送模式
	MOVIA	0x01
	MCALL	_CS1630_ModeSwitch
	.line	46, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_FEATURE, 0x04);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1d
	MCALL	_CS1630_write_byte
	.line	47, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	48, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x04); // 配置值
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_CS1630_write_byte
	.line	50, "BSP\app_tx.c"; 	CS1630_Tx_Payload[7] = s_data_num; // 序号，用于区分不同数据包
	BANKSEL	_s_data_num
	MOVR	_s_data_num,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 7)
	.line	51, "BSP\app_tx.c"; 	CS1630_Tx_Payload[8] = code_value; // 码值，用于指示功能
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 8)
	.line	54, "BSP\app_tx.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
	.line	55, "BSP\app_tx.c"; 	CS1630_Flush_Tx();
	MCALL	_CS1630_Flush_Tx
	.line	56, "BSP\app_tx.c"; 	CS1630_Clear_All_Irq();
	MCALL	_CS1630_Clear_All_Irq
	.line	58, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	59, "BSP\app_tx.c"; 	delay_ms(5);
	MOVIA	0x05
	MCALL	_delay_ms
	.line	61, "BSP\app_tx.c"; 	for (k = 0; k < 3; k++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_02026_DS_:
	.line	64, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1022
	CLRR	r0x1022
_02016_DS_:
	.line	66, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	67, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1023
	CLRR	r0x1023
_02014_DS_:
	.line	69, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1026
	CLRR	r0x1026
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK02
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	70, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	71, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	72, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02009_DS_:
	.line	76, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	77, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1024,5
	MGOTO	_02005_DS_
	BTRSS	r0x1024,4
	MGOTO	_02009_DS_
_02005_DS_:
	.line	79, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	67, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1023
	INCR	r0x1023,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	MGOTO	_02014_DS_
	.line	64, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1022
	INCR	r0x1022,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1022,W
	BTRSS	STATUS,0
	MGOTO	_02016_DS_
	.line	61, "BSP\app_tx.c"; 	for (k = 0; k < 3; k++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	87, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	88, "BSP\app_tx.c"; 	delay_ms(1);
	MOVIA	0x01
	MCALL	_delay_ms
	.line	90, "BSP\app_tx.c"; 	}
	RETURN	
; exit point of _send_ble_packet


;	code size estimation:
;	  101+   26 =   127 instructions (  306 byte)

	end
