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
	extern	_main
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
	extern	_g_timer0_delay_conut_2
	extern	_g_timer0_delay_conut_1

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
_g_timer0_delay_conut_1:
	.debuginfo complex-type (symbol "_g_timer0_delay_conut_1" 1 global "main.c" 12 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_g_timer0_delay_conut_2:
	.debuginfo complex-type (symbol "_g_timer0_delay_conut_2" 1 global "main.c" 13 (basetype 1 unsigned))

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
	.line	15, "main.c"; 	void isr(void) __interrupt(0)
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
	.line	17, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02007_DS_
	.line	19, "main.c"; 	INTFbits.PABIF = 0;					// 清除PABIF（PortB输入变化中断标志位）
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02007_DS_:
	.line	21, "main.c"; 	}
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
;   _key_init
;   _Check_Keydown
;   _wake_up_init
;   _key_init
;   _CS1630_Init
;   _key_init
;   _Check_Keydown
;   _wake_up_init
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sleep_status" 1 "main.c" 39 (basetype 1 unsigned) split "r0x1005")
_main:
; 2 exit points
	.line	35, "main.c"; 	DISI();
	DISI
	.line	36, "main.c"; 	key_init();
	MCALL	_key_init
	.line	37, "main.c"; 	CS1630_Init(); // 初始化CS1630模块
	MCALL	_CS1630_Init
	.line	38, "main.c"; 	ENI();
	ENI
_02023_DS_:
	.line	43, "main.c"; 	key_init();
	MCALL	_key_init
	.line	44, "main.c"; 	sleep_status = Check_Keydown();
	MCALL	_Check_Keydown
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	46, "main.c"; 	if(sleep_status == 0)
	MOVR	r0x1005,W
	BTRSS	STATUS,2
	MGOTO	_02017_DS_
	.line	48, "main.c"; 	g_timer0_delay_conut_1 = 0;
	BANKSEL	_g_timer0_delay_conut_1
	CLRR	_g_timer0_delay_conut_1
	.line	49, "main.c"; 	g_timer0_delay_conut_2 = 0;
	BANKSEL	_g_timer0_delay_conut_2
	CLRR	_g_timer0_delay_conut_2
_02017_DS_:
	.line	52, "main.c"; 	g_timer0_delay_conut_1 ++;
	BANKSEL	_g_timer0_delay_conut_1
	MOVR	_g_timer0_delay_conut_1,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_g_timer0_delay_conut_1
	MOVAR	_g_timer0_delay_conut_1
	.line	54, "main.c"; 	if(g_timer0_delay_conut_1 == 255)
	MOVR	_g_timer0_delay_conut_1,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02019_DS_
	.line	56, "main.c"; 	g_timer0_delay_conut_1 = 0;
	CLRR	_g_timer0_delay_conut_1
	.line	57, "main.c"; 	g_timer0_delay_conut_2 ++;
	BANKSEL	_g_timer0_delay_conut_2
	MOVR	_g_timer0_delay_conut_2,W
	BANKSEL	r0x1005
	MOVAR	r0x1005
	INCR	r0x1005,W
	BANKSEL	_g_timer0_delay_conut_2
	MOVAR	_g_timer0_delay_conut_2
_02019_DS_:
	.line	60, "main.c"; 	if(g_timer0_delay_conut_2 == 255)
	BANKSEL	_g_timer0_delay_conut_2
	MOVR	_g_timer0_delay_conut_2,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02023_DS_
	.line	62, "main.c"; 	g_timer0_delay_conut_2 = 0;
	CLRR	_g_timer0_delay_conut_2
	.line	63, "main.c"; 	wake_up_init();
	MCALL	_wake_up_init
	.line	64, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	65, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	66, "main.c"; 	SLEEP();
	sleep
	.line	67, "main.c"; 	INTFbits.PABIF = 0;	// 清除PABIF（PortB输入变化中断标志位）
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	MGOTO	_02023_DS_
	.line	70, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_wake_up_init
	.debuginfo subprogram _wake_up_init
_wake_up_init:
; 2 exit points
	.line	25, "main.c"; 	AWUCON = 0xfc;
	MOVIA	0xfc
	MOVAR	_AWUCON
	.line	26, "main.c"; 	BWUCON = 0x00;
	CLRR	_BWUCON
	.line	27, "main.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	28, "main.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	29, "main.c"; 	INTE = C_INT_PABKey;
	MOVIA	0x02
	MOVAR	_INTE
	.line	30, "main.c"; 	INTF = 0x00;
	CLRR	_INTF
	.line	31, "main.c"; 	}
	RETURN	
; exit point of _wake_up_init


;	code size estimation:
;	   76+   16 =    92 instructions (  216 byte)

	end
