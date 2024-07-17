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
	extern	_usart_send_string
	extern	_usart_send_byte
	extern	_usart_init
	extern	_send_ble_packet_test
	extern	_send_rf_packet_test
	extern	_delay_40us
	extern	_delay_us
	extern	_delay_250ms
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
	extern	_send_ble_packet
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

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_HS6230_Tx_Payload:
	.res 32
	.debuginfo complex-type (symbol "_HS6230_Tx_Payload" 32 local "BSP\app_tx.c" 7 (array 32 (basetype 1 unsigned)))

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
r0x1023:
	.res	1
.segment "uninit"
r0x1022:
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
_s_data_num:
	.debuginfo complex-type (symbol "_s_data_num" 1 local "BSP\app_tx.c" 13 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "code"
_channel_index:
	retia 0x02	; 2
	retia 0x1a	; 26
	retia 0x50	; 80	'P'

.segment "code"
___str_0:
	retia 0x42 ; 'B'
	retia 0x4c ; 'L'
	retia 0x45 ; 'E'
	retia 0x20 ; ' '
	retia 0x70 ; 'p'
	retia 0x61 ; 'a'
	retia 0x63 ; 'c'
	retia 0x6b ; 'k'
	retia 0x65 ; 'e'
	retia 0x74 ; 't'
	retia 0x20 ; ' '
	retia 0x73 ; 's'
	retia 0x65 ; 'e'
	retia 0x6e ; 'n'
	retia 0x64 ; 'd'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'
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
;   _usart_send_string
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
;   _delay_40us
;   _HS6230_CE_Low
;   _HS6230_read_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _delay_ms
;   _usart_send_string
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
;   _delay_40us
;   _HS6230_CE_Low
;   _HS6230_read_byte
;   _HS6230_write_byte
;   _HS6230_write_byte
;   _delay_ms
;9 compiler assigned registers:
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   STK01
;   STK00
;   r0x1025
;   STK03
;   STK02
;; Starting pCode block
.segment "code"; module=app_tx, function=_send_ble_packet
	.debuginfo subprogram _send_ble_packet
;local variable name mapping:
	.debuginfo complex-type (local-sym "_code_value" 1 "BSP\app_tx.c" 14 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\app_tx.c" 17 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_tx.c" 19 (basetype 1 unsigned) split "r0x1023")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_tx.c" 21 (basetype 1 unsigned) split "r0x1022")
_send_ble_packet:
; 2 exit points
	.line	14, "BSP\app_tx.c"; 	void send_ble_packet(unsigned char code_value)
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	16, "BSP\app_tx.c"; 	usart_send_string("BLE packet send/r/n");
	MOVIA	((___str_0 + 0) >> 8) & 0xff
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	(___str_0 + 0)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVIA	0x80
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK01
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK00
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MCALL	_usart_send_string
	.line	23, "BSP\app_tx.c"; 	s_data_num++;
	BANKSEL	_s_data_num
	INCR	_s_data_num,F
	.line	25, "BSP\app_tx.c"; 	HS6230_Init(); // 初始化HS6230模块
	MCALL	_HS6230_Init
	.line	26, "BSP\app_tx.c"; 	HS6230_CE_Low(); // 设置CE引脚为低电平，准备发送数据
	MCALL	_HS6230_CE_Low
	.line	27, "BSP\app_tx.c"; 	HS6230_ModeSwitch(Rf_PTX_Mode); // 切换到发送模式
	MOVIA	0x01
	MCALL	_HS6230_ModeSwitch
	.line	30, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_FEATURE, 0x04);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1d
	MCALL	_HS6230_write_byte
	.line	31, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	32, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_SETUP_VALUE, 0x04); // 配置值
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_HS6230_write_byte
	.line	35, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x02;       // 数据包长度的首字节
	MOVIA	0x02
	BANKSEL	_HS6230_Tx_Payload
	MOVAR	(_HS6230_Tx_Payload + 0)
	.line	36, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x01;       // 数据包类型
	MOVIA	0x01
	MOVAR	(_HS6230_Tx_Payload + 1)
	.line	37, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x06;       // 标志位，包括可发现模式和支持的蓝牙技术类型
	MOVIA	0x06
	MOVAR	(_HS6230_Tx_Payload + 2)
	.line	44, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x10;
	MOVIA	0x10
	MOVAR	(_HS6230_Tx_Payload + 3)
	.line	45, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 4)
	.line	47, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x54;       // 同步系列
	MOVIA	0x54
	MOVAR	(_HS6230_Tx_Payload + 5)
	.line	48, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0x45;       // 同步系列
	MOVIA	0x45
	MOVAR	(_HS6230_Tx_Payload + 6)
	.line	49, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = s_data_num; // 序号，用于区分不同数据包
	BANKSEL	_s_data_num
	MOVR	_s_data_num,W
	BANKSEL	_HS6230_Tx_Payload
	MOVAR	(_HS6230_Tx_Payload + 7)
	.line	50, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = code_value; // 码值，用于指示功能
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	BANKSEL	_HS6230_Tx_Payload
	MOVAR	(_HS6230_Tx_Payload + 8)
	.line	51, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xBF;       // 识别码
	MOVIA	0xbf
	MOVAR	(_HS6230_Tx_Payload + 9)
	.line	52, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xAA;       // 识别码
	MOVIA	0xaa
	MOVAR	(_HS6230_Tx_Payload + 10)
	.line	53, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 11)
	.line	54, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 12)
	.line	55, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 13)
	.line	56, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 14)
	.line	57, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 15)
	.line	58, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 16)
	.line	59, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 17)
	.line	60, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 18)
	.line	61, "BSP\app_tx.c"; 	HS6230_Tx_Payload[len ++] = 0xFF;
	MOVIA	0xff
	MOVAR	(_HS6230_Tx_Payload + 19)
	.line	64, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1021
	CLRR	r0x1021
_02015_DS_:
	.line	67, "BSP\app_tx.c"; 	HS6230_CE_Low();
	MCALL	_HS6230_CE_Low
	.line	68, "BSP\app_tx.c"; 	HS6230_Flush_Tx();
	MCALL	_HS6230_Flush_Tx
	.line	69, "BSP\app_tx.c"; 	HS6230_Clear_All_Irq();
	MCALL	_HS6230_Clear_All_Irq
	.line	72, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x0e);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	73, "BSP\app_tx.c"; 	delay_ms(5);
	MOVIA	0x05
	MCALL	_delay_ms
	.line	76, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1023
	CLRR	r0x1023
_02013_DS_:
	.line	78, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	r0x1022
	MOVR	r0x1022,W
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
	MCALL	_HS6230_write_byte
	.line	79, "BSP\app_tx.c"; 	HS6230_SendPack(RF_W_TX_PAYLOAD, HS6230_Tx_Payload, len); // 发送数据包
	MOVIA	(_HS6230_Tx_Payload + 0)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1024
	CLRR	r0x1024
	BANKSEL	r0x1025
	CLRR	r0x1025
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_HS6230_SendPack
	.line	80, "BSP\app_tx.c"; 	HS6230_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_HS6230_CE_High
	.line	81, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	82, "BSP\app_tx.c"; 	HS6230_CE_Low(); // 结束脉冲
	MCALL	_HS6230_CE_Low
_02009_DS_:
	.line	86, "BSP\app_tx.c"; 	status = HS6230_read_byte(HS6230_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_HS6230_read_byte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	87, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1022,5
	MGOTO	_02005_DS_
	BTRSS	r0x1022,4
	MGOTO	_02009_DS_
_02005_DS_:
	.line	89, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_HS6230_write_byte
	.line	76, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1023
	INCR	r0x1023,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1023,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	.line	96, "BSP\app_tx.c"; 	HS6230_write_byte(HS6230_BANK0_CONFIG, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_HS6230_write_byte
	.line	97, "BSP\app_tx.c"; 	delay_ms(1);
	MOVIA	0x01
	MCALL	_delay_ms
	.line	64, "BSP\app_tx.c"; 	for(i = 0; i < 3; i++)
	BANKSEL	r0x1021
	INCR	r0x1021,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1021,W
	BTRSS	STATUS,0
	MGOTO	_02015_DS_
	.line	99, "BSP\app_tx.c"; 	}
	RETURN	
; exit point of _send_ble_packet


;	code size estimation:
;	  143+   31 =   174 instructions (  410 byte)

	end
