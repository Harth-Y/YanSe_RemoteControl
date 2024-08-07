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
	.debuginfo complex-type (symbol "_sleep_conut_1" 1 global "main.c" 12 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_sleep_conut_2:
	.debuginfo complex-type (symbol "_sleep_conut_2" 1 global "main.c" 13 (basetype 1 unsigned))

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
	.line	90, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	92, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02040_DS_
	.line	94, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	.line	95, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02040_DS_:
	.line	97, "main.c"; 	}
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
;   _sleep_count
;   _key_init
;   _CS1630_Init
;   _open_WDT
;   _key_init
;   _Check_Keydown
;   _sleep_count
;1 compiler assigned register :
;   r0x1006
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sleep_status" 1 "main.c" 77 (basetype 1 unsigned) split "r0x1006")
_main:
; 2 exit points
	.line	71, "main.c"; 	DISI();
	DISI
	.line	72, "main.c"; 	key_init();
	MCALL	_key_init
	.line	73, "main.c"; 	CS1630_Init();
	MCALL	_CS1630_Init
	.line	74, "main.c"; 	open_WDT();
	MCALL	_open_WDT
	.line	75, "main.c"; 	ENI();
	ENI
_02033_DS_:
	.line	81, "main.c"; 	CLRWDT();
	clrwdt
	.line	82, "main.c"; 	key_init();
	MCALL	_key_init
	.line	83, "main.c"; 	sleep_status = Check_Keydown();
	MCALL	_Check_Keydown
	BANKSEL	r0x1006
	MOVAR	r0x1006
	.line	84, "main.c"; 	sleep_count(sleep_status);
	MOVR	r0x1006,W
	MCALL	_sleep_count
	MGOTO	_02033_DS_
	.line	86, "main.c"; 	}
	RETURN	
; exit point of _main

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
	.debuginfo complex-type (local-sym "_s_sleep_status" 1 "main.c" 46 (basetype 1 unsigned) split "r0x1005")
_sleep_count:
; 2 exit points
	.line	46, "main.c"; 	void sleep_count(unsigned char s_sleep_status)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	48, "main.c"; 	if(s_sleep_status == 0)
	MOVR	r0x1005,W
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	.line	50, "main.c"; 	sleep_conut_1 = 0;
	BANKSEL	_sleep_conut_1
	CLRR	_sleep_conut_1
	.line	51, "main.c"; 	sleep_conut_2 = 0;
	BANKSEL	_sleep_conut_2
	CLRR	_sleep_conut_2
_02022_DS_:
	.line	54, "main.c"; 	sleep_conut_1 ++;
	BANKSEL	_sleep_conut_1
	MOVR	_sleep_conut_1,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_sleep_conut_1
	MOVAR	_sleep_conut_1
;;unsigned compare: left < lit(0xFF=255), size=1
	.line	56, "main.c"; 	if(sleep_conut_1 >= 255)
	MOVIA	0xff
	SUBAR	_sleep_conut_1,W
	BTRSS	STATUS,0
	MGOTO	_02024_DS_
	.line	58, "main.c"; 	sleep_conut_1 = 0;
	CLRR	_sleep_conut_1
	.line	59, "main.c"; 	sleep_conut_2 ++;
	BANKSEL	_sleep_conut_2
	MOVR	_sleep_conut_2,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_sleep_conut_2
	MOVAR	_sleep_conut_2
;;unsigned compare: left < lit(0x20=32), size=1
_02024_DS_:
	.line	62, "main.c"; 	if(sleep_conut_2 >= 32) // 5s
	MOVIA	0x20
	BANKSEL	_sleep_conut_2
	SUBAR	_sleep_conut_2,W
	BTRSS	STATUS,0
	MGOTO	_02027_DS_
	.line	64, "main.c"; 	sleep_conut_2 = 0;
	CLRR	_sleep_conut_2
	.line	65, "main.c"; 	go_to_sleep();
	MCALL	_go_to_sleep
_02027_DS_:
	.line	67, "main.c"; 	}
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
	.line	39, "main.c"; 	close_WDT();
	MCALL	_close_WDT
	.line	40, "main.c"; 	wake_up_init();
	MCALL	_wake_up_init
	.line	41, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	42, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	43, "main.c"; 	SLEEP();
	sleep
	.line	44, "main.c"; 	}
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
	.line	33, "main.c"; 	PCON &= ~C_WDT_En;
	BCR	_PCON,7
	.line	34, "main.c"; 	PCON &= ~C_LVR_En;
	BCR	_PCON,3
	.line	35, "main.c"; 	}
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
	.line	27, "main.c"; 	PCON |= C_WDT_En;	//使能看门狗
	BSR	_PCON,7
	.line	28, "main.c"; 	PCON |= C_LVR_En;	//低压复位使能
	BSR	_PCON,3
	.line	29, "main.c"; 	}
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
	.line	17, "main.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	18, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	19, "main.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	20, "main.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	21, "main.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	22, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	23, "main.c"; 	}
	RETURN	
; exit point of _wake_up_init


;	code size estimation:
;	   89+   17 =   106 instructions (  246 byte)

	end
