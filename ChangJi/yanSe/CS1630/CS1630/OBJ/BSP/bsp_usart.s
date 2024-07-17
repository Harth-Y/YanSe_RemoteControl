;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\bsp_usart.c"
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
	extern	_usart_init
	extern	_usart_send_byte
	extern	_usart_send_string

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
r0x1000:
	.res	1
.segment "uninit"
r0x1001:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1005:
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
; code_bsp_usart	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _usart_send_byte
;   __gptrget1
;   _usart_send_byte
;6 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   STK01
;   r0x1004
;   r0x1005
;; Starting pCode block
.segment "code"; module=bsp_usart, function=_usart_send_string
	.debuginfo subprogram _usart_send_string
_usart_send_string:
; 2 exit points
	.line	39, "BSP\bsp_usart.c"; 	void usart_send_string(uint8_t *str)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVR	STK00,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	MOVR	STK01,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
_02018_DS_:
	.line	41, "BSP\bsp_usart.c"; 	while (*str)
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK01
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MOVAR	STK00
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MCALL	__gptrget1
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	r0x1005,W
	BTRSC	STATUS,2
	MGOTO	_02021_DS_
	.line	43, "BSP\bsp_usart.c"; 	usart_send_byte(*str++);
	BANKSEL	r0x1004
	INCR	r0x1004,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1003
	INCR	r0x1003,F
_00001_DS_:
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x1002
	INCR	r0x1002,F
_00002_DS_:
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_usart_send_byte
	MGOTO	_02018_DS_
_02021_DS_:
	.line	45, "BSP\bsp_usart.c"; 	}
	RETURN	
; exit point of _usart_send_string

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
.segment "code"; module=bsp_usart, function=_usart_send_byte
	.debuginfo subprogram _usart_send_byte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_data" 1 "BSP\bsp_usart.c" 16 (basetype 1 unsigned) split "r0x1000")
	.debuginfo complex-type (local-sym "_i" 1 "BSP\bsp_usart.c" 18 (basetype 1 unsigned) split "r0x1001")
_usart_send_byte:
; 2 exit points
	.line	16, "BSP\bsp_usart.c"; 	void usart_send_byte(uint8_t data)
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	19, "BSP\bsp_usart.c"; 	PORTAbits.PA2=0;
	BCR	_PORTAbits,2
	.line	20, "BSP\bsp_usart.c"; 	delay_us(17);
	MOVIA	0x11
	MCALL	_delay_us
	.line	21, "BSP\bsp_usart.c"; 	for (i = 0; i < 8; i++)
	BANKSEL	r0x1001
	CLRR	r0x1001
_02013_DS_:
	.line	24, "BSP\bsp_usart.c"; 	if (data & 0x01)
	BANKSEL	r0x1000
	BTRSS	r0x1000,0
	MGOTO	_02010_DS_
	.line	26, "BSP\bsp_usart.c"; 	PORTAbits.PA2=1;
	BSR	_PORTAbits,2
	MGOTO	_02011_DS_
_02010_DS_:
	.line	30, "BSP\bsp_usart.c"; 	PORTAbits.PA2=0;
	BCR	_PORTAbits,2
_02011_DS_:
	.line	32, "BSP\bsp_usart.c"; 	data >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1000
	RRR	r0x1000,F
	.line	33, "BSP\bsp_usart.c"; 	delay_us(17);
	MOVIA	0x11
	MCALL	_delay_us
	.line	21, "BSP\bsp_usart.c"; 	for (i = 0; i < 8; i++)
	BANKSEL	r0x1001
	INCR	r0x1001,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1001,W
	BTRSS	STATUS,0
	MGOTO	_02013_DS_
	.line	35, "BSP\bsp_usart.c"; 	PORTAbits.PA2=1;
	BSR	_PORTAbits,2
	.line	36, "BSP\bsp_usart.c"; 	delay_us(17);
	MOVIA	0x11
	MCALL	_delay_us
	.line	37, "BSP\bsp_usart.c"; 	}
	RETURN	
; exit point of _usart_send_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=bsp_usart, function=_usart_init
	.debuginfo subprogram _usart_init
_usart_init:
; 2 exit points
	.line	10, "BSP\bsp_usart.c"; 	IOSTA = 0;
	CLRA	
	IOST	_IOSTA
	.line	11, "BSP\bsp_usart.c"; 	APHCON = 0;
	CLRA	
	IOST	_APHCON
	.line	12, "BSP\bsp_usart.c"; 	PORTA = 0x04;
	MOVIA	0x04
	MOVAR	_PORTA
	.line	13, "BSP\bsp_usart.c"; 	PORTAbits.PA2=1;
	BSR	_PORTAbits,2
	.line	14, "BSP\bsp_usart.c"; 	}
	RETURN	
; exit point of _usart_init


;	code size estimation:
;	   57+   16 =    73 instructions (  178 byte)

	end
