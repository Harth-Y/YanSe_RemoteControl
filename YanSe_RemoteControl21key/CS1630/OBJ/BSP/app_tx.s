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
	extern	_CS1630_Resend_Tx_Payload
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
	extern	_CS1630_Reuse_Tx_Payload
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
	extern	_one_key_twice_dowm
	extern	_key_status_change
	extern	_rolling_code_3
	extern	_rolling_code_2
	extern	_rolling_code_1
	extern	_rolling_code_0
	extern	_send_ble_packet

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_rolling_code_0:
	.res 1
	.debuginfo complex-type (symbol "_rolling_code_0" 1 global "BSP\app_tx.c" 6 (basetype 1 unsigned))

.segment "uninit"
_rolling_code_1:
	.res 1
	.debuginfo complex-type (symbol "_rolling_code_1" 1 global "BSP\app_tx.c" 7 (basetype 1 unsigned))

.segment "uninit"
_rolling_code_2:
	.res 1
	.debuginfo complex-type (symbol "_rolling_code_2" 1 global "BSP\app_tx.c" 8 (basetype 1 unsigned))

.segment "uninit"
_rolling_code_3:
	.res 1
	.debuginfo complex-type (symbol "_rolling_code_3" 1 global "BSP\app_tx.c" 9 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
r0x102D:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_key_status_change:
	.debuginfo complex-type (symbol "_key_status_change" 1 global "BSP\app_tx.c" 10 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_one_key_twice_dowm:
	.debuginfo complex-type (symbol "_one_key_twice_dowm" 1 global "BSP\app_tx.c" 11 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_CS1630_Tx_Payload:
	.debuginfo complex-type (symbol "_CS1630_Tx_Payload" 32 local "BSP\app_tx.c" 12 (array 32 (basetype 1 unsigned)))

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
;   _CS1630_write_byte
;   _delay_ms
;12 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   STK01
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   STK03
;   STK02
;   r0x102C
;   r0x102D
;; Starting pCode block
.segment "code"; module=app_tx, function=_send_ble_packet
	.debuginfo subprogram _send_ble_packet
;local variable name mapping:
	.debuginfo complex-type (local-sym "_code_value" 1 "BSP\app_tx.c" 40 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_send_times" 1 "BSP\app_tx.c" 40 (basetype 1 unsigned) split "r0x1027")
	.debuginfo complex-type (local-sym "_Serial_Number" 1 "BSP\app_tx.c" 40 (basetype 1 unsigned) split "r0x1028")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_tx.c" 45 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_mini_circle" 1 "BSP\app_tx.c" 43 (basetype 1 unsigned) split "r0x1028")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_tx.c" 46 (basetype 1 unsigned) split "r0x1029")
	.debuginfo complex-type (local-sym "_enter_interput_times" 1 "BSP\app_tx.c" 47 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_great_circle" 1 "BSP\app_tx.c" 44 (basetype 1 unsigned) split "r0x1028")
_send_ble_packet:
; 2 exit points
	.line	40, "BSP\app_tx.c"; 	void send_ble_packet(unsigned char code_value, unsigned char send_times, unsigned char Serial_Number)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK00,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK01,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	42, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	50, "BSP\app_tx.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	51, "BSP\app_tx.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	52, "BSP\app_tx.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	53, "BSP\app_tx.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	55, "BSP\app_tx.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	56, "BSP\app_tx.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	59, "BSP\app_tx.c"; 	CS1630_Tx_Payload[7] = Serial_Number; // 序号，用于区分不同数据包
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 7)
	.line	60, "BSP\app_tx.c"; 	CS1630_Tx_Payload[8] = code_value; // 码值，用于指示功能
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 8)
	.line	61, "BSP\app_tx.c"; 	CS1630_Tx_Payload[11] = rolling_code_0; // 码值，用于指示功能
	BANKSEL	_rolling_code_0
	MOVR	_rolling_code_0,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 11)
	.line	62, "BSP\app_tx.c"; 	CS1630_Tx_Payload[12] = rolling_code_1; // 码值，用于指示功能
	BANKSEL	_rolling_code_1
	MOVR	_rolling_code_1,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 12)
	.line	63, "BSP\app_tx.c"; 	CS1630_Tx_Payload[13] = rolling_code_2; // 码值，用于指示功能
	BANKSEL	_rolling_code_2
	MOVR	_rolling_code_2,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 13)
	.line	64, "BSP\app_tx.c"; 	CS1630_Tx_Payload[14] = rolling_code_3; // 码值，用于指示功能
	BANKSEL	_rolling_code_3
	MOVR	_rolling_code_3,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 14)
	.line	67, "BSP\app_tx.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
	.line	68, "BSP\app_tx.c"; 	CS1630_Flush_Tx();
	MCALL	_CS1630_Flush_Tx
	.line	69, "BSP\app_tx.c"; 	CS1630_Clear_All_Irq();
	MCALL	_CS1630_Clear_All_Irq
	.line	72, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0f);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	73, "BSP\app_tx.c"; 	delay_ms(5);
	MOVIA	0x05
	MCALL	_delay_ms
	.line	75, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	76, "BSP\app_tx.c"; 	PB4 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,4
	.line	78, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1026
	CLRR	r0x1026
_02028_DS_:
	.line	80, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	81, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	82, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1028
	CLRR	r0x1028
_02026_DS_:
	.line	84, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	MOVIA	0x14
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
	MCALL	_CS1630_SendPack
	.line	85, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	86, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	87, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02009_DS_:
	.line	91, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	92, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1029,5
	MGOTO	_02005_DS_
	BTRSS	r0x1029,4
	MGOTO	_02009_DS_
_02005_DS_:
	.line	94, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	82, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1028
	INCR	r0x1028,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	78, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1026
	INCR	r0x1026,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1026,W
	BTRSS	STATUS,0
	MGOTO	_02028_DS_
	.line	100, "BSP\app_tx.c"; 	PB4 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,4
	.line	101, "BSP\app_tx.c"; 	key_status_change = 0;
	BANKSEL	_key_status_change
	CLRR	_key_status_change
	.line	103, "BSP\app_tx.c"; 	for(great_circle = 0; great_circle < send_times; great_circle++)
	BANKSEL	r0x1026
	CLRR	r0x1026
	BANKSEL	r0x1028
	CLRR	r0x1028
_02035_DS_:
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	r0x1028
	SUBAR	r0x1028,W
	BTRSC	STATUS,0
	MGOTO	_02025_DS_
	.line	105, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	107, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1029
	CLRR	r0x1029
_02032_DS_:
	.line	109, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	110, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x102C
	MOVAR	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	111, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x102A
	CLRR	r0x102A
_02030_DS_:
	.line	113, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	115, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	116, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	117, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02017_DS_:
	.line	121, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	122, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x102B,5
	MGOTO	_02013_DS_
	BTRSS	r0x102B,4
	MGOTO	_02017_DS_
_02013_DS_:
	.line	124, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	111, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x102A
	INCR	r0x102A,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x102A,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	107, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	MGOTO	_02032_DS_
	.line	131, "BSP\app_tx.c"; 	if(key_status_change == 1)
	BANKSEL	_key_status_change
	MOVR	_key_status_change,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	.line	133, "BSP\app_tx.c"; 	key_status_change = 0;
	CLRR	_key_status_change
	.line	134, "BSP\app_tx.c"; 	enter_interput_times++;
	BANKSEL	r0x1026
	INCR	r0x1026,F
	.line	135, "BSP\app_tx.c"; 	if(enter_interput_times == 2)
	MOVR	r0x1026,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	.line	137, "BSP\app_tx.c"; 	one_key_twice_dowm = 1;
	MOVIA	0x01
	BANKSEL	_one_key_twice_dowm
	MOVAR	_one_key_twice_dowm
	.line	139, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	140, "BSP\app_tx.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	141, "BSP\app_tx.c"; 	return;
	MGOTO	_02037_DS_
_02036_DS_:
	.line	103, "BSP\app_tx.c"; 	for(great_circle = 0; great_circle < send_times; great_circle++)
	BANKSEL	r0x1028
	INCR	r0x1028,F
	MGOTO	_02035_DS_
_02025_DS_:
	.line	147, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	148, "BSP\app_tx.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
_02037_DS_:
	.line	149, "BSP\app_tx.c"; 	}
	RETURN	
; exit point of _send_ble_packet


;	code size estimation:
;	  187+   62 =   249 instructions (  622 byte)

	end
