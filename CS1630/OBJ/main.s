;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_send_ble_packet
	extern	_Check_Keydown
	extern	_set_PB_low
	extern	_set_PA_low
	extern	_key_init
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
	extern	_clear_ram
	extern	_multi_16b
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
	extern	_one_key_twice_dowm
	extern	_key_status_change
	extern	_SLEEP_STATUS
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_CS1630_init_main
	extern	_close_WDT
	extern	_open_WDT
	extern	_wake_up_init
	extern	_isr
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
	extern	_Serial_Number
	extern	_old_key_value
	extern	_sleep_time_count_2
	extern	_slepp_time_count_1

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

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
___STK12:
STK12:
	.res 1
.segment "share_bank"
___STK11:
STK11:
	.res 1
.segment "share_bank"
___STK10:
STK10:
	.res 1
.segment "share_bank"
___STK09:
STK09:
	.res 1
.segment "share_bank"
___STK08:
STK08:
	.res 1
.segment "share_bank"
___STK07:
STK07:
	.res 1
.segment "share_bank"
___STK06:
STK06:
	.res 1
.segment "share_bank"
___STK05:
STK05:
	.res 1
.segment "share_bank"
___STK04:
STK04:
	.res 1
.segment "share_bank"
___STK03:
STK03:
	.res 1
.segment "share_bank"
___STK02:
STK02:
	.res 1
.segment "share_bank"
___STK01:
STK01:
	.res 1
.segment "share_bank"
___STK00:
STK00:
	.res 1

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
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_slepp_time_count_1:
	.debuginfo complex-type (symbol "_slepp_time_count_1" 1 global "main.c" 13 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_sleep_time_count_2:
	.debuginfo complex-type (symbol "_sleep_time_count_2" 1 global "main.c" 14 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_old_key_value:
	.debuginfo complex-type (symbol "_old_key_value" 1 global "main.c" 15 (basetype 1 unsigned))

	dw	0xff	; 255


.segment "idata"
_Serial_Number:
	.debuginfo complex-type (symbol "_Serial_Number" 1 global "main.c" 16 (basetype 1 unsigned))

	dw	0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	20, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	22, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02007_DS_
	.line	24, "main.c"; 	key_status_change = 1;
	MOVIA	0x01
	BANKSEL	_key_status_change
	MOVAR	_key_status_change
	.line	25, "main.c"; 	INTFbits.PABIF = 0;					// 清除PABIF（PortB输入变化中断标志位）
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02007_DS_:
	.line	27, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _CS1630_init_main
;   _wake_up_init
;   _open_WDT
;   _key_init
;   _Check_Keydown
;   _send_ble_packet
;   _send_ble_packet
;   _delay_ms
;   _send_ble_packet
;   _send_ble_packet
;   _wake_up_init
;   _close_WDT
;   _open_WDT
;   _CS1630_init_main
;   _wake_up_init
;   _open_WDT
;   _key_init
;   _Check_Keydown
;   _send_ble_packet
;   _send_ble_packet
;   _delay_ms
;   _send_ble_packet
;   _send_ble_packet
;   _wake_up_init
;   _close_WDT
;   _open_WDT
;6 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo complex-type (local-sym "_old_key_status" 1 "main.c" 77 (basetype 1 unsigned) split "r0x1009")
	.debuginfo complex-type (local-sym "_key_value" 1 "main.c" 75 (basetype 1 unsigned) split "r0x100A")
	.debuginfo complex-type (local-sym "_Code_Value" 1 "main.c" 76 (basetype 1 unsigned) split "r0x100B")
_main:
; 2 exit points
	.line	68, "main.c"; 	DISI();
	DISI
	.line	69, "main.c"; 	CS1630_init_main();
	MCALL	_CS1630_init_main
	.line	70, "main.c"; 	wake_up_init();
	MCALL	_wake_up_init
	.line	71, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	.line	72, "main.c"; 	ENI();
	ENI
	.line	77, "main.c"; 	unsigned char old_key_status = 0;
	BANKSEL	r0x1009
	CLRR	r0x1009
	.line	78, "main.c"; 	key_status_change = 0;
	BANKSEL	_key_status_change
	CLRR	_key_status_change
_02050_DS_:
	.line	82, "main.c"; 	CLRWDT();
	clrwdt
	.line	83, "main.c"; 	key_init();
	MCALL	_key_init
	.line	84, "main.c"; 	key_value = Check_Keydown();
	MCALL	_Check_Keydown
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	87, "main.c"; 	if(key_value != 0)
	MOVR	r0x100A,W
	BTRSC	STATUS,2
	MGOTO	_02029_DS_
	.line	89, "main.c"; 	slepp_time_count_1 = 0;
	BANKSEL	_slepp_time_count_1
	CLRR	_slepp_time_count_1
	.line	90, "main.c"; 	sleep_time_count_2 = 0;
	BANKSEL	_sleep_time_count_2
	CLRR	_sleep_time_count_2
	.line	91, "main.c"; 	Code_Value = key_value - 1;
	BANKSEL	r0x100A
	DECR	r0x100A,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MGOTO	_02030_DS_
_02029_DS_:
	.line	95, "main.c"; 	Code_Value = 0xff;
	MOVIA	0xff
	BANKSEL	r0x100B
	MOVAR	r0x100B
_02030_DS_:
	.line	98, "main.c"; 	if(key_value != 0) // 当键值不为0
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BTRSC	STATUS,2
	MGOTO	_02041_DS_
	.line	100, "main.c"; 	if(old_key_status == 0) // 上一次按键扫描结果为空时，流水号增加
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	BTRSS	STATUS,2
	MGOTO	_02038_DS_
	.line	102, "main.c"; 	Serial_Number++;
	BANKSEL	_Serial_Number
	MOVR	_Serial_Number,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	INCR	r0x100C,W
	BANKSEL	_Serial_Number
	MOVAR	_Serial_Number
	.line	103, "main.c"; 	send_ble_packet(Code_Value, 15, Serial_Number);
	MOVR	_Serial_Number,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MCALL	_send_ble_packet
	MGOTO	_02041_DS_
_02038_DS_:
	.line	107, "main.c"; 	if(key_value == old_key_value) // 当键值与旧键值一致
	BANKSEL	_old_key_value
	MOVR	_old_key_value,W
	BANKSEL	r0x100A
	XORAR	r0x100A,W
	BTRSS	STATUS,2
	MGOTO	_02035_DS_
	.line	109, "main.c"; 	if(one_key_twice_dowm == 0) // 不是从中断跳出来的，流水号不增加,判定为长按
	BANKSEL	_one_key_twice_dowm
	MOVR	_one_key_twice_dowm,W
	BTRSS	STATUS,2
	MGOTO	_02032_DS_
	.line	111, "main.c"; 	send_ble_packet(Code_Value, 0, Serial_Number);
	BANKSEL	_Serial_Number
	MOVR	_Serial_Number,W
	MOVAR	STK01
	MOVIA	0x00
	MOVAR	STK00
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MCALL	_send_ble_packet
	.line	112, "main.c"; 	delay_ms(90);
	MOVIA	0x5a
	MCALL	_delay_ms
	MGOTO	_02041_DS_
_02032_DS_:
	.line	116, "main.c"; 	one_key_twice_dowm = 0;
	BANKSEL	_one_key_twice_dowm
	CLRR	_one_key_twice_dowm
	.line	117, "main.c"; 	Serial_Number++;
	BANKSEL	_Serial_Number
	MOVR	_Serial_Number,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	INCR	r0x100C,W
	BANKSEL	_Serial_Number
	MOVAR	_Serial_Number
	.line	118, "main.c"; 	send_ble_packet(Code_Value, 15, Serial_Number);
	MOVR	_Serial_Number,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MCALL	_send_ble_packet
	MGOTO	_02041_DS_
_02035_DS_:
	.line	123, "main.c"; 	Serial_Number++;
	BANKSEL	_Serial_Number
	MOVR	_Serial_Number,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	INCR	r0x100C,W
	BANKSEL	_Serial_Number
	MOVAR	_Serial_Number
	.line	124, "main.c"; 	send_ble_packet(Code_Value, 15, Serial_Number);
	MOVR	_Serial_Number,W
	MOVAR	STK01
	MOVIA	0x0f
	MOVAR	STK00
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MCALL	_send_ble_packet
_02041_DS_:
	.line	128, "main.c"; 	CLRWDT();
	clrwdt
	.line	131, "main.c"; 	if(key_value != 0)
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BTRSC	STATUS,2
	MGOTO	_02043_DS_
	.line	133, "main.c"; 	old_key_status = 1;
	MOVIA	0x01
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	134, "main.c"; 	old_key_value = key_value;
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	BANKSEL	_old_key_value
	MOVAR	_old_key_value
	MGOTO	_02044_DS_
_02043_DS_:
	.line	138, "main.c"; 	old_key_status = 0;
	BANKSEL	r0x1009
	CLRR	r0x1009
_02044_DS_:
	.line	142, "main.c"; 	slepp_time_count_1 ++;
	BANKSEL	_slepp_time_count_1
	MOVR	_slepp_time_count_1,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	INCR	r0x100A,W
	BANKSEL	_slepp_time_count_1
	MOVAR	_slepp_time_count_1
	.line	143, "main.c"; 	if(slepp_time_count_1 == 255)
	MOVR	_slepp_time_count_1,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02046_DS_
	.line	145, "main.c"; 	slepp_time_count_1 = 0;
	CLRR	_slepp_time_count_1
	.line	146, "main.c"; 	sleep_time_count_2 ++;
	BANKSEL	_sleep_time_count_2
	MOVR	_sleep_time_count_2,W
	BANKSEL	r0x100A
	MOVAR	r0x100A
	INCR	r0x100A,W
	BANKSEL	_sleep_time_count_2
	MOVAR	_sleep_time_count_2
_02046_DS_:
	.line	148, "main.c"; 	if(sleep_time_count_2 == 20)
	BANKSEL	_sleep_time_count_2
	MOVR	_sleep_time_count_2,W
	XORIA	0x14
	BTRSS	STATUS,2
	MGOTO	_02050_DS_
	.line	150, "main.c"; 	sleep_time_count_2 = 0;
	CLRR	_sleep_time_count_2
	.line	151, "main.c"; 	wake_up_init();
	MCALL	_wake_up_init
	.line	152, "main.c"; 	close_WDT();
	MCALL	_close_WDT
	.line	153, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	154, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	155, "main.c"; 	SLEEP();
	sleep
	.line	156, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	MGOTO	_02050_DS_
	.line	159, "main.c"; 	}
	RETURN	
; exit point of _main

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
;   _CS1630_write_byte
;   _delay_ms
;   _CS1630_Init
;   _CS1630_CE_Low
;   _CS1630_ModeSwitch
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _CS1630_write_byte
;   _delay_ms
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_CS1630_init_main
	.debuginfo subprogram _CS1630_init_main
_CS1630_init_main:
; 2 exit points
	.line	54, "main.c"; 	CS1630_Init(); // 初始化CS1630模块
	MCALL	_CS1630_Init
	.line	55, "main.c"; 	CS1630_CE_Low(); // 设置CE引脚为低电平，准备发送数据
	MCALL	_CS1630_CE_Low
	.line	56, "main.c"; 	CS1630_ModeSwitch(Rf_PTX_Mode); // 切换到发送模式
	MOVIA	0x01
	MCALL	_CS1630_ModeSwitch
	.line	59, "main.c"; 	CS1630_write_byte(CS1630_BANK0_FEATURE, 0x04);
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1d
	MCALL	_CS1630_write_byte
	.line	60, "main.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0f);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	61, "main.c"; 	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x04); // 配置值
	MOVIA	0x04
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_CS1630_write_byte
	.line	62, "main.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	63, "main.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	64, "main.c"; 	}
	RETURN	
; exit point of _CS1630_init_main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_close_WDT
	.debuginfo subprogram _close_WDT
_close_WDT:
; 2 exit points
	.line	48, "main.c"; 	PCON &= ~C_WDT_En;
	BCR	_PCON,7
	.line	49, "main.c"; 	PCON &= ~C_LVR_En;
	BCR	_PCON,3
	.line	50, "main.c"; 	}
	RETURN	
; exit point of _close_WDT

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_open_WDT
	.debuginfo subprogram _open_WDT
_open_WDT:
; 2 exit points
	.line	42, "main.c"; 	PCON |= C_WDT_En;	//使能看门狗
	BSR	_PCON,7
	.line	43, "main.c"; 	PCON |= C_LVR_En;	//低压复位使能
	BSR	_PCON,3
	.line	44, "main.c"; 	}
	RETURN	
; exit point of _open_WDT

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_wake_up_init
	.debuginfo subprogram _wake_up_init
_wake_up_init:
; 2 exit points
	.line	31, "main.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	32, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	33, "main.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	34, "main.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	36, "main.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	37, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	38, "main.c"; 	}
	RETURN	
; exit point of _wake_up_init


;	code size estimation:
;	  179+   47 =   226 instructions (  546 byte)

	end
