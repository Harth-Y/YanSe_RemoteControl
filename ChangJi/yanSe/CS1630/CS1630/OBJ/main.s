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
	extern	_usart_send_string
	extern	_usart_send_byte
	extern	_usart_init
	extern	_send_ble_packet
	extern	_Check_Keydown
	extern	_set_PB_low
	extern	_set_PA_low
	extern	_key_init
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
	extern	_timer_init
	extern	_isr_wake_up
	extern	_isr_sleep
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
	extern	_system_tick

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
_system_tick:
	.debuginfo complex-type (symbol "_system_tick" 1 global "main.c" 13 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_isr_sleep_tick_1s_65536_60:
	.debuginfo complex-type (symbol "_isr_sleep_tick_1s_65536_60" 1 local "main.c" 18 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "idata"
_isr_sleep_tick_30s_65536_60:
	.debuginfo complex-type (symbol "_isr_sleep_tick_30s_65536_60" 1 local "main.c" 19 (basetype 1 unsigned))

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
; software interrupt and initialization code
;--------------------------------------------------------
ORG 0x0001
	MGOTO	__sdcc_sw_interrupt

.segment "code"
__sdcc_sw_interrupt:
;***
;  pBlock Stats: dbName = U
;***
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr_wake_up:
; 0 exit points
	.line	40, "main.c"; 	void isr_wake_up() __interrupt(1)
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
	.line	42, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02020_DS_
	.line	44, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02020_DS_:
	.line	46, "main.c"; 	}
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
END_OF_SW_INTERRUPT:
	RETIE	

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
_isr_sleep:
; 0 exit points
	.line	16, "main.c"; 	void isr_sleep() __interrupt(0)
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
	.line	20, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	MGOTO	_02013_DS_
	.line	22, "main.c"; 	INTFbits.T0IF = 0;//清除中断标志
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	23, "main.c"; 	TMR0 = 100;//Timer0寄存器重新从100开始计数
	MOVIA	0x64
	MOVAR	_TMR0
	.line	25, "main.c"; 	if(++tick_1s >= 200)
	BANKSEL	_isr_sleep_tick_1s_65536_60
	INCR	_isr_sleep_tick_1s_65536_60,F
;;unsigned compare: left < lit(0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_isr_sleep_tick_1s_65536_60,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	.line	27, "main.c"; 	tick_1s = 0;
	CLRR	_isr_sleep_tick_1s_65536_60
	.line	28, "main.c"; 	if(++tick_30s >= 30)
	BANKSEL	_isr_sleep_tick_30s_65536_60
	INCR	_isr_sleep_tick_30s_65536_60,F
;;unsigned compare: left < lit(0x1E=30), size=1
	MOVIA	0x1e
	SUBAR	_isr_sleep_tick_30s_65536_60,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	.line	30, "main.c"; 	tick_30s = 0;
	CLRR	_isr_sleep_tick_30s_65536_60
	.line	31, "main.c"; 	if(SLEEP_STATUS == 1)
	BANKSEL	_SLEEP_STATUS
	MOVR	_SLEEP_STATUS,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02013_DS_
	.line	33, "main.c"; 	SLEEP();
	sleep
_02013_DS_:
	.line	38, "main.c"; 	}
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
;   _HS6230_Init
;   _send_ble_packet
;   _delay_250ms
;   _HS6230_Init
;   _send_ble_packet
;   _delay_250ms
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	68, "main.c"; 	DISI();
	DISI
	.line	71, "main.c"; 	HS6230_Init();
	MCALL	_HS6230_Init
	.line	75, "main.c"; 	ENI();
	ENI
_02034_DS_:
	.line	80, "main.c"; 	send_ble_packet(0x02);
	MOVIA	0x02
	MCALL	_send_ble_packet
	.line	81, "main.c"; 	delay_250ms();
	MCALL	_delay_250ms
	MGOTO	_02034_DS_
	.line	83, "main.c"; 	} 
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
	.line	60, "main.c"; 	AWUCON = 0xC3;
	MOVIA	0xc3
	MOVAR	_AWUCON
	.line	61, "main.c"; 	BWUCON = 0x0f;
	MOVIA	0x0f
	MOVAR	_BWUCON
	.line	62, "main.c"; 	INTE |= C_INT_PABKey;
	BSR	_INTE,1
	.line	63, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	64, "main.c"; 	}
	RETURN	
; exit point of _wake_up_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1006
;; Starting pCode block
.segment "code"; module=main, function=_timer_init
	.debuginfo subprogram _timer_init
_timer_init:
; 2 exit points
	.line	50, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	51, "main.c"; 	TMR0 = 100;
	MOVIA	0x64
	MOVAR	_TMR0
	.line	52, "main.c"; 	T0MD = C_PS0_TMR0;
	CLRA	
	T0MD	
	.line	53, "main.c"; 	T0MD |= C_PS0_Div64;
	T0MDR	
	BANKSEL	r0x1006
	MOVAR	r0x1006
	MOVIA	0x05
	IORAR	r0x1006,F
	MOVR	r0x1006,W
	T0MD	
	.line	54, "main.c"; 	INTE = C_INT_TMR0;
	MOVIA	0x01
	MOVAR	_INTE
	.line	55, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	56, "main.c"; 	}
	RETURN	
; exit point of _timer_init


;	code size estimation:
;	  109+   16 =   125 instructions (  282 byte)

	end
