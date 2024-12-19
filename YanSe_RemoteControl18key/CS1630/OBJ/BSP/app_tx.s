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
	extern	_one_key_twice_dowm
	extern	_key_status_change
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

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_key_status_change:
	.debuginfo complex-type (symbol "_key_status_change" 1 global "BSP\app_tx.c" 9 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_one_key_twice_dowm:
	.debuginfo complex-type (symbol "_one_key_twice_dowm" 1 global "BSP\app_tx.c" 10 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_CS1630_Tx_Payload:
	.debuginfo complex-type (symbol "_CS1630_Tx_Payload" 32 local "BSP\app_tx.c" 11 (array 32 (basetype 1 unsigned)))

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
;   r0x1025
;   STK00
;   r0x1026
;   STK01
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   STK03
;   STK02
;   r0x102B
;   r0x102C
;; Starting pCode block
.segment "code"; module=app_tx, function=_send_ble_packet
	.debuginfo subprogram _send_ble_packet
;local variable name mapping:
	.debuginfo complex-type (local-sym "_code_value" 1 "BSP\app_tx.c" 39 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_send_times" 1 "BSP\app_tx.c" 39 (basetype 1 unsigned) split "r0x1026")
	.debuginfo complex-type (local-sym "_Serial_Number" 1 "BSP\app_tx.c" 39 (basetype 1 unsigned) split "r0x1027")
	.debuginfo complex-type (local-sym "_idx" 1 "BSP\app_tx.c" 44 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_mini_circle" 1 "BSP\app_tx.c" 42 (basetype 1 unsigned) split "r0x1027")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\app_tx.c" 45 (basetype 1 unsigned) split "r0x1028")
	.debuginfo complex-type (local-sym "_enter_interput_times" 1 "BSP\app_tx.c" 46 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_great_circle" 1 "BSP\app_tx.c" 43 (basetype 1 unsigned) split "r0x1027")
_send_ble_packet:
; 2 exit points
	.line	39, "BSP\app_tx.c"; 	void send_ble_packet(unsigned char code_value, unsigned char send_times, unsigned char Serial_Number)
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK00,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK01,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	41, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	49, "BSP\app_tx.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	50, "BSP\app_tx.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	51, "BSP\app_tx.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	52, "BSP\app_tx.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	54, "BSP\app_tx.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	55, "BSP\app_tx.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	58, "BSP\app_tx.c"; 	CS1630_Tx_Payload[7] = Serial_Number; // 序号，用于区分不同数据包
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 7)
	.line	59, "BSP\app_tx.c"; 	CS1630_Tx_Payload[8] = code_value; // 码值，用于指示功能
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 8)
	.line	60, "BSP\app_tx.c"; 	CS1630_Tx_Payload[11] = rolling_code_0; // 码值，用于指示功能
	BANKSEL	_rolling_code_0
	MOVR	_rolling_code_0,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 11)
	.line	61, "BSP\app_tx.c"; 	CS1630_Tx_Payload[12] = rolling_code_1; // 码值，用于指示功能
	BANKSEL	_rolling_code_1
	MOVR	_rolling_code_1,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 12)
	.line	62, "BSP\app_tx.c"; 	CS1630_Tx_Payload[13] = rolling_code_2; // 码值，用于指示功能
	BANKSEL	_rolling_code_2
	MOVR	_rolling_code_2,W
	BANKSEL	_CS1630_Tx_Payload
	MOVAR	(_CS1630_Tx_Payload + 13)
	.line	64, "BSP\app_tx.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
	.line	65, "BSP\app_tx.c"; 	CS1630_Flush_Tx();
	MCALL	_CS1630_Flush_Tx
	.line	66, "BSP\app_tx.c"; 	CS1630_Clear_All_Irq();
	MCALL	_CS1630_Clear_All_Irq
	.line	69, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0f);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	70, "BSP\app_tx.c"; 	delay_ms(5);
	MOVIA	0x05
	MCALL	_delay_ms
	.line	72, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	73, "BSP\app_tx.c"; 	PB4 = 1;
	BANKSEL	_PORTB
	BSR	_PORTB,4
	.line	75, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1025
	CLRR	r0x1025
_02028_DS_:
	.line	77, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	78, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	79, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1027
	CLRR	r0x1027
_02026_DS_:
	.line	81, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	BANKSEL	r0x102A
	CLRR	r0x102A
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK02
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK01
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	82, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	83, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	84, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02009_DS_:
	.line	88, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	89, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x1028,5
	MGOTO	_02005_DS_
	BTRSS	r0x1028,4
	MGOTO	_02009_DS_
_02005_DS_:
	.line	91, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	79, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1027,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	75, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1025
	INCR	r0x1025,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1025,W
	BTRSS	STATUS,0
	MGOTO	_02028_DS_
	.line	97, "BSP\app_tx.c"; 	PB4 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,4
	.line	98, "BSP\app_tx.c"; 	key_status_change = 0;
	BANKSEL	_key_status_change
	CLRR	_key_status_change
	.line	100, "BSP\app_tx.c"; 	for(great_circle = 0; great_circle < send_times; great_circle++)
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1027
	CLRR	r0x1027
_02035_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1027
	SUBAR	r0x1027,W
	BTRSC	STATUS,0
	MGOTO	_02025_DS_
	.line	102, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	104, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1028
	CLRR	r0x1028
_02032_DS_:
	.line	106, "BSP\app_tx.c"; 	CLRWDT();
	clrwdt
	.line	107, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	ADDIA	(_channel_index + 0)
	BANKSEL	r0x1029
	MOVAR	r0x1029
	MOVIA	((_channel_index + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK01
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_CS1630_write_byte
	.line	108, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1029
	CLRR	r0x1029
_02030_DS_:
	.line	110, "BSP\app_tx.c"; 	CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
	MOVIA	(_CS1630_Tx_Payload + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	MOVIA	0x14
	MOVAR	STK03
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0xa0
	MCALL	_CS1630_SendPack
	.line	111, "BSP\app_tx.c"; 	CS1630_CE_High(); // 产生CE脉冲，开始发送
	MCALL	_CS1630_CE_High
	.line	112, "BSP\app_tx.c"; 	delay_40us(); // 等待脉冲稳定
	MCALL	_delay_40us
	.line	113, "BSP\app_tx.c"; 	CS1630_CE_Low(); // 结束脉冲
	MCALL	_CS1630_CE_Low
_02017_DS_:
	.line	117, "BSP\app_tx.c"; 	status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	118, "BSP\app_tx.c"; 	if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
	BTRSC	r0x102A,5
	MGOTO	_02013_DS_
	BTRSS	r0x102A,4
	MGOTO	_02017_DS_
_02013_DS_:
	.line	120, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	108, "BSP\app_tx.c"; 	for(mini_circle = 0; mini_circle < 3; mini_circle++)
	BANKSEL	r0x1029
	INCR	r0x1029,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1029,W
	BTRSS	STATUS,0
	MGOTO	_02030_DS_
	.line	104, "BSP\app_tx.c"; 	for(idx = 0; idx < 3; idx++)
	BANKSEL	r0x1028
	INCR	r0x1028,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	r0x1028,W
	BTRSS	STATUS,0
	MGOTO	_02032_DS_
	.line	127, "BSP\app_tx.c"; 	if(key_status_change == 1)
	BANKSEL	_key_status_change
	MOVR	_key_status_change,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	.line	129, "BSP\app_tx.c"; 	key_status_change = 0;
	CLRR	_key_status_change
	.line	130, "BSP\app_tx.c"; 	enter_interput_times++;
	BANKSEL	r0x1025
	INCR	r0x1025,F
	.line	131, "BSP\app_tx.c"; 	if(enter_interput_times == 2)
	MOVR	r0x1025,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02036_DS_
	.line	133, "BSP\app_tx.c"; 	one_key_twice_dowm = 1;
	MOVIA	0x01
	BANKSEL	_one_key_twice_dowm
	MOVAR	_one_key_twice_dowm
	.line	135, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	136, "BSP\app_tx.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	137, "BSP\app_tx.c"; 	return;
	MGOTO	_02037_DS_
_02036_DS_:
	.line	100, "BSP\app_tx.c"; 	for(great_circle = 0; great_circle < send_times; great_circle++)
	BANKSEL	r0x1027
	INCR	r0x1027,F
	MGOTO	_02035_DS_
_02025_DS_:
	.line	143, "BSP\app_tx.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	144, "BSP\app_tx.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
_02037_DS_:
	.line	145, "BSP\app_tx.c"; 	}
	RETURN	
; exit point of _send_ble_packet


;	code size estimation:
;	  185+   60 =   245 instructions (  610 byte)

	end
