;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\bsp_delay.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_delay_ms
	extern	_delay_250ms
	extern	_delay_us
	extern	_delay_40us

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
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
; code_bsp_delay	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;; Starting pCode block
.segment "code"; module=bsp_delay, function=_delay_40us
	.debuginfo subprogram _delay_40us
_delay_40us:
; 2 exit points
	.line	31, "BSP\bsp_delay.c"; 	delay_us(6);
	MOVIA	0x06
	MCALL	_delay_us
	.line	32, "BSP\bsp_delay.c"; 	}
	RETURN	
; exit point of _delay_40us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
.segment "code"; module=bsp_delay, function=_delay_us
	.debuginfo subprogram _delay_us
;local variable name mapping:
	.debuginfo complex-type (local-sym "_nus" 1 "BSP\bsp_delay.c" 22 (basetype 1 unsigned) split "r0x1000")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\bsp_delay.c" 24 (basetype 1 unsigned) split "r0x1001")
_delay_us:
; 2 exit points
	.line	22, "BSP\bsp_delay.c"; 	void delay_us(unsigned char nus)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	25, "BSP\bsp_delay.c"; 	for(i=1;i<=nus;i++)
	MOVIA	0x01
	BANKSEL	r0x1001
	MOVAR	r0x1001
_02024_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BANKSEL	r0x1000
	SUBAR	r0x1000,W
	BTRSS	STATUS,0
	MGOTO	_02026_DS_
	.line	26, "BSP\bsp_delay.c"; 	NOP(); // 3.5239us
	nop
	.line	25, "BSP\bsp_delay.c"; 	for(i=1;i<=nus;i++)
	BANKSEL	r0x1001
	INCR	r0x1001,F
	MGOTO	_02024_DS_
_02026_DS_:
	.line	27, "BSP\bsp_delay.c"; 	}
	RETURN	
; exit point of _delay_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ms
;   _delay_ms
;   _delay_ms
;   _delay_ms
;; Starting pCode block
.segment "code"; module=bsp_delay, function=_delay_250ms
	.debuginfo subprogram _delay_250ms
_delay_250ms:
; 2 exit points
	.line	17, "BSP\bsp_delay.c"; 	delay_ms(155);
	MOVIA	0x9b
	MCALL	_delay_ms
	.line	18, "BSP\bsp_delay.c"; 	CLRWDT();
	clrwdt
	.line	19, "BSP\bsp_delay.c"; 	delay_ms(124);
	MOVIA	0x7c
	MCALL	_delay_ms
	.line	20, "BSP\bsp_delay.c"; 	}
	RETURN	
; exit point of _delay_250ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=bsp_delay, function=_delay_ms
	.debuginfo subprogram _delay_ms
;local variable name mapping:
	.debuginfo complex-type (local-sym "_count" 1 "BSP\bsp_delay.c" 5 (basetype 1 unsigned) split "r0x1002")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\bsp_delay.c" 7 (basetype 1 unsigned) split "r0x1003")
	.debuginfo complex-type (local-sym "_j" 1 "BSP\bsp_delay.c" 8 (basetype 1 unsigned) split "r0x1004")
_delay_ms:
; 2 exit points
	.line	5, "BSP\bsp_delay.c"; 	void delay_ms(unsigned char count)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	9, "BSP\bsp_delay.c"; 	for(i = 0; i < count; i++)
	BANKSEL	r0x1003
	CLRR	r0x1003
_02011_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	BANKSEL	r0x1003
	SUBAR	r0x1003,W
	BTRSC	STATUS,0
	MGOTO	_02013_DS_
	.line	11, "BSP\bsp_delay.c"; 	for(j = 0; j < 254; j++)
	MOVIA	0xfe
	BANKSEL	r0x1004
	MOVAR	r0x1004
_02009_DS_:
	.line	12, "BSP\bsp_delay.c"; 	NOP();
	nop
	BANKSEL	r0x1004
	DECR	r0x1004,F
	.line	11, "BSP\bsp_delay.c"; 	for(j = 0; j < 254; j++)
	MOVR	r0x1004,W
	BTRSS	STATUS,2
	MGOTO	_02009_DS_
	.line	9, "BSP\bsp_delay.c"; 	for(i = 0; i < count; i++)
	BANKSEL	r0x1003
	INCR	r0x1003,F
	MGOTO	_02011_DS_
_02013_DS_:
	.line	14, "BSP\bsp_delay.c"; 	}
	RETURN	
; exit point of _delay_ms


;	code size estimation:
;	   33+   12 =    45 instructions (  114 byte)

	end
