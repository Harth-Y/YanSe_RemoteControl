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
	extern	_led
	extern	_led_open
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
	extern	_isr
	extern	_main
	extern	_send_data
	extern	_sleep_count
	extern	_go_to_sleep
	extern	_close_WDT
	extern	_open_WDT
	extern	_wake_up_init
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
	extern	_sleep_conut_2
	extern	_sleep_conut_1

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
r0x1005:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1009:
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
_sleep_conut_1:
	.debuginfo complex-type (symbol "_sleep_conut_1" 1 global "main.c" 16 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_sleep_conut_2:
	.debuginfo complex-type (symbol "_sleep_conut_2" 1 global "main.c" 17 (basetype 1 unsigned))

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
;functions called:
;   _open_WDT
;   _open_WDT
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	139, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	141, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02075_DS_
	.line	143, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	.line	144, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02075_DS_:
	.line	146, "main.c"; 	}
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
;   _key_init
;   _CS1630_Init
;   _open_WDT
;   _key_init
;   _Check_Keydown
;   _send_data
;   _sleep_count
;   _key_init
;   _CS1630_Init
;   _open_WDT
;   _key_init
;   _Check_Keydown
;   _send_data
;   _sleep_count
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sCodeValue" 1 "main.c" 121 (basetype 1 unsigned) split "r0x1009")
_main:
; 2 exit points
	.line	115, "main.c"; 	DISI();
	DISI
	.line	116, "main.c"; 	key_init();
	MCALL	_key_init
	.line	117, "main.c"; 	CS1630_Init();
	MCALL	_CS1630_Init
	.line	118, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	.line	119, "main.c"; 	ENI();
	ENI
_02068_DS_:
	.line	125, "main.c"; 	CLRWDT();
	clrwdt
	.line	126, "main.c"; 	key_init();
	MCALL	_key_init
	.line	127, "main.c"; 	sCodeValue = Check_Keydown();
	MCALL	_Check_Keydown
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	128, "main.c"; 	if(sCodeValue != 0)
	MOVR	r0x1009,W
	BTRSC	STATUS,2
	MGOTO	_02066_DS_
	.line	130, "main.c"; 	send_data(sCodeValue);
	MOVR	r0x1009,W
	MCALL	_send_data
_02066_DS_:
	.line	132, "main.c"; 	sleep_count(sCodeValue);
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	MCALL	_sleep_count
	.line	133, "main.c"; 	sCodeValue = 0;
	MGOTO	_02068_DS_
	.line	135, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _key_init
;   _send_ble_packet
;   _send_ble_packet
;   _delay_250ms
;   _delay_ms
;   _key_init
;   _key_init
;   _send_ble_packet
;   _send_ble_packet
;   _delay_250ms
;   _delay_ms
;   _key_init
;4 compiler assigned registers:
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;; Starting pCode block
.segment "code"; module=main, function=_send_data
	.debuginfo subprogram _send_data
;local variable name mapping:
	.debuginfo complex-type (local-sym "_CodeValue" 1 "main.c" 76 (basetype 1 unsigned) split "r0x1005")
	.debuginfo complex-type (local-sym "_KeyStatus" 1 "main.c" 78 (basetype 1 unsigned) split "r0x1006")
	.debuginfo complex-type (local-sym "_KeyStatus_s" 1 "main.c" 79 (basetype 1 unsigned) split "r0x1007")
_send_data:
; 2 exit points
	.line	76, "main.c"; 	void send_data(unsigned char CodeValue)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	80, "main.c"; 	if(CodeValue != 0)
	MOVR	r0x1005,W
	BTRSC	STATUS,2
	MGOTO	_02041_DS_
	.line	82, "main.c"; 	key_init();
	MCALL	_key_init
	.line	83, "main.c"; 	KeyStatus = PORTA & 0xfc;
	MOVIA	0xfc
	ANDAR	_PORTA,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	.line	84, "main.c"; 	KeyStatus_s = 1;
	MOVIA	0x01
	BANKSEL	r0x1007
	MOVAR	r0x1007
_02036_DS_:
	.line	86, "main.c"; 	while(0xfc != (PORTA & 0xfC))
	MOVIA	0xfc
	ANDAR	_PORTA,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	r0x1008,W
	XORIA	0xfc
	BTRSS	STATUS,2
	MGOTO	_02059_DS_
	MGOTO	_02041_DS_
_02059_DS_:
	.line	89, "main.c"; 	send_ble_packet(CodeValue);
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_send_ble_packet
	.line	94, "main.c"; 	if(KeyStatus_s == 1)
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02033_DS_
	.line	96, "main.c"; 	send_ble_packet(CodeValue);
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_send_ble_packet
	.line	98, "main.c"; 	KeyStatus_s = 0;
	BANKSEL	r0x1007
	CLRR	r0x1007
	.line	99, "main.c"; 	PB4 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,4
	.line	100, "main.c"; 	delay_250ms();
	MCALL	_delay_250ms
_02033_DS_:
	.line	102, "main.c"; 	PB4 = 0;
	BANKSEL	_PORTB
	BCR	_PORTB,4
	.line	103, "main.c"; 	delay_ms(50);
	MOVIA	0x32
	MCALL	_delay_ms
	.line	104, "main.c"; 	key_init();
	MCALL	_key_init
	.line	105, "main.c"; 	if(KeyStatus != (PORTA & 0xfc)) // 若与一开始按的不是同一个按键则退出重新检测
	MOVIA	0xfc
	ANDAR	_PORTA,W
	BANKSEL	r0x1008
	MOVAR	r0x1008
	MOVR	r0x1008,W
	BANKSEL	r0x1006
	XORAR	r0x1006,W
	BTRSS	STATUS,2
	MGOTO	_02041_DS_
	MGOTO	_02036_DS_
_02041_DS_:
	.line	109, "main.c"; 	}
	RETURN	
; exit point of _send_data

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _go_to_sleep
;   _go_to_sleep
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
.segment "code"; module=main, function=_sleep_count
	.debuginfo subprogram _sleep_count
;local variable name mapping:
	.debuginfo complex-type (local-sym "_s_sleep_status" 1 "main.c" 53 (basetype 1 unsigned) split "r0x1005")
_sleep_count:
; 2 exit points
	.line	53, "main.c"; 	void sleep_count(unsigned char s_sleep_status)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	55, "main.c"; 	if(s_sleep_status != 0) // 有按键被按下，重新计时
	MOVR	r0x1005,W
	BTRSC	STATUS,2
	MGOTO	_02022_DS_
	.line	57, "main.c"; 	sleep_conut_1 = 0;
	BANKSEL	_sleep_conut_1
	CLRR	_sleep_conut_1
	.line	58, "main.c"; 	sleep_conut_2 = 0;
	BANKSEL	_sleep_conut_2
	CLRR	_sleep_conut_2
_02022_DS_:
	.line	61, "main.c"; 	sleep_conut_1 ++;
	BANKSEL	_sleep_conut_1
	MOVR	_sleep_conut_1,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_sleep_conut_1
	MOVAR	_sleep_conut_1
;;unsigned compare: left < lit(0xFF=255), size=1
	.line	63, "main.c"; 	if(sleep_conut_1 >= 255)
	MOVIA	0xff
	SUBAR	_sleep_conut_1,W
	BTRSS	STATUS,0
	MGOTO	_02024_DS_
	.line	65, "main.c"; 	sleep_conut_1 = 0;
	CLRR	_sleep_conut_1
	.line	66, "main.c"; 	sleep_conut_2 ++;
	BANKSEL	_sleep_conut_2
	MOVR	_sleep_conut_2,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_sleep_conut_2
	MOVAR	_sleep_conut_2
;;unsigned compare: left < lit(0x20=32), size=1
_02024_DS_:
	.line	69, "main.c"; 	if(sleep_conut_2 >= 32) // 5s
	MOVIA	0x20
	BANKSEL	_sleep_conut_2
	SUBAR	_sleep_conut_2,W
	BTRSS	STATUS,0
	MGOTO	_02027_DS_
	.line	71, "main.c"; 	sleep_conut_2 = 0;
	CLRR	_sleep_conut_2
	.line	72, "main.c"; 	go_to_sleep();
	MCALL	_go_to_sleep
_02027_DS_:
	.line	74, "main.c"; 	}
	RETURN	
; exit point of _sleep_count

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _close_WDT
;   _wake_up_init
;   _close_WDT
;   _wake_up_init
;; Starting pCode block
.segment "code"; module=main, function=_go_to_sleep
	.debuginfo subprogram _go_to_sleep
_go_to_sleep:
; 2 exit points
	.line	46, "main.c"; 	close_WDT();
	MCALL	_close_WDT
	.line	47, "main.c"; 	wake_up_init();
	MCALL	_wake_up_init
	.line	48, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	49, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	50, "main.c"; 	SLEEP();
	sleep
	.line	51, "main.c"; 	}
	RETURN	
; exit point of _go_to_sleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_close_WDT
	.debuginfo subprogram _close_WDT
_close_WDT:
; 2 exit points
	.line	40, "main.c"; 	PCON &= ~C_WDT_En;
	BCR	_PCON,7
	.line	41, "main.c"; 	PCON &= ~C_LVR_En;
	BCR	_PCON,3
	.line	42, "main.c"; 	}
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
	.line	34, "main.c"; 	PCON |= C_WDT_En;	//使能看门狗
	BSR	_PCON,7
	.line	35, "main.c"; 	PCON |= C_LVR_En;	//低压复位使能
	BSR	_PCON,3
	.line	36, "main.c"; 	}
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
	.line	23, "main.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	24, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	26, "main.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;
	MOVIA	0xfc
	IOST	_IOSTA
	.line	27, "main.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	28, "main.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	29, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	30, "main.c"; 	}
	RETURN	
; exit point of _wake_up_init


;	code size estimation:
;	  136+   30 =   166 instructions (  392 byte)

	end
