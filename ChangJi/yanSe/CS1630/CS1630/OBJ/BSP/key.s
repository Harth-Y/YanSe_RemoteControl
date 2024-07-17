;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\key.c"
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
	extern	_Check_Keydown
	extern	_key_init
	extern	_set_PB_low
	extern	_set_PA_low
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
	extern	_SLEEP_STATUS

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
r0x1001:
	.res	1
.segment "uninit"
r0x1002:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_SLEEP_STATUS:
	.debuginfo complex-type (symbol "_SLEEP_STATUS" 1 global "BSP\key.c" 7 (basetype 1 unsigned))

	dw	0x01	; 1


.segment "code"
___str_0:
	retia 0x6b ; 'k'
	retia 0x65 ; 'e'
	retia 0x79 ; 'y'
	retia 0x20 ; ' '
	retia 0x64 ; 'd'
	retia 0x6f ; 'o'
	retia 0x77 ; 'w'
	retia 0x6e ; 'n'
	retia 0x0d ; '.'
	retia 0x0a ; '.'
	retia 0x00 ; '.'

.segment "code"
___str_1:
	retia 0x42 ; 'B'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_2:
	retia 0x42 ; 'B'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_3:
	retia 0x42 ; 'B'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_4:
	retia 0x42 ; 'B'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_5:
	retia 0x41 ; 'A'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_6:
	retia 0x41 ; 'A'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_7:
	retia 0x41 ; 'A'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x31 ; '1'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_8:
	retia 0x41 ; 'A'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x31 ; '1'
	retia 0x30 ; '0'
	retia 0x2f ; '/'
	retia 0x72 ; 'r'
	retia 0x2f ; '/'
	retia 0x6e ; 'n'
	retia 0x00 ; '.'

.segment "code"
___str_9:
	retia 0x73 ; 's'
	retia 0x43 ; 'C'
	retia 0x6f ; 'o'
	retia 0x64 ; 'd'
	retia 0x65 ; 'e'
	retia 0x56 ; 'V'
	retia 0x61 ; 'a'
	retia 0x6c ; 'l'
	retia 0x75 ; 'u'
	retia 0x65 ; 'e'
	retia 0x3a ; ':'
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
; code_key	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ms
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _set_PB_low
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _set_PA_low
;   _usart_send_string
;   _usart_send_byte
;   _delay_ms
;   _delay_ms
;   _delay_ms
;   _delay_ms
;   _send_ble_packet
;   _delay_ms
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _set_PB_low
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _usart_send_string
;   _set_PA_low
;   _usart_send_string
;   _usart_send_byte
;   _delay_ms
;   _delay_ms
;   _delay_ms
;   _delay_ms
;   _send_ble_packet
;7 compiler assigned registers:
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=key, function=_Check_Keydown
	.debuginfo subprogram _Check_Keydown
;local variable name mapping:
	.debuginfo complex-type (local-sym "_KeyValue" 1 "BSP\key.c" 41 (basetype 1 unsigned) split "r0x1001")
	.debuginfo complex-type (local-sym "_KeyStatus" 1 "BSP\key.c" 43 (basetype 1 unsigned) split "r0x1002")
	.debuginfo complex-type (local-sym "_sCodeValue" 1 "BSP\key.c" 42 (basetype 1 unsigned) split "r0x1002")
_Check_Keydown:
; 2 exit points
	.line	41, "BSP\key.c"; 	unsigned char KeyValue=0;
	BANKSEL	r0x1001
	CLRR	r0x1001
	.line	45, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	46, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1002,F
	.line	47, "BSP\key.c"; 	if(KeyStatus != 0x0f)
	MOVR	r0x1002,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02092_DS_
	MGOTO	_02034_DS_
_02092_DS_:
	.line	49, "BSP\key.c"; 	delay_ms(10);
	MOVIA	0x0a
	MCALL	_delay_ms
	.line	50, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	51, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1002,F
	.line	52, "BSP\key.c"; 	if(KeyStatus != 0x0f)
	MOVR	r0x1002,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02093_DS_
	MGOTO	_02028_DS_
_02093_DS_:
	.line	54, "BSP\key.c"; 	usart_send_string("key down\r\n");
	MOVIA	((___str_0 + 0) >> 8) & 0xff
	BANKSEL	r0x1003
	MOVAR	r0x1003
	MOVIA	(___str_0 + 0)
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	0x80
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK01
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MOVAR	STK00
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_usart_send_string
	.line	55, "BSP\key.c"; 	SLEEP_STATUS = 0;
	BANKSEL	_SLEEP_STATUS
	CLRR	_SLEEP_STATUS
	.line	56, "BSP\key.c"; 	switch(KeyStatus)
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_02094_DS_
	MGOTO	_02020_DS_
_02094_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0b
	BTRSS	STATUS,2
	MGOTO	_02095_DS_
	MGOTO	_02019_DS_
_02095_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0d
	BTRSS	STATUS,2
	MGOTO	_02096_DS_
	MGOTO	_02018_DS_
_02096_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0e
	BTRSS	STATUS,2
	MGOTO	_02021_DS_
	.line	58, "BSP\key.c"; 	case(0X0e):	KeyValue=0x01;usart_send_string("B0111/r/n");break;
	MOVIA	0x01
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	((___str_1 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_1 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02021_DS_
_02018_DS_:
	.line	59, "BSP\key.c"; 	case(0X0d):	KeyValue=0x02;usart_send_string("B1011/r/n");break;
	MOVIA	0x02
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	((___str_2 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_2 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02021_DS_
_02019_DS_:
	.line	60, "BSP\key.c"; 	case(0X0b): KeyValue=0x03;usart_send_string("B1101/r/n");break;
	MOVIA	0x03
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	((___str_3 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_3 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02021_DS_
_02020_DS_:
	.line	61, "BSP\key.c"; 	case(0X07):	KeyValue=0x04;usart_send_string("B1110/r/n");break;
	MOVIA	0x04
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MOVIA	((___str_4 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_4 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
_02021_DS_:
	.line	63, "BSP\key.c"; 	BPHCON = 0x3F;
	MOVIA	0x3f
	MOVAR	_BPHCON
	.line	64, "BSP\key.c"; 	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output;
	CLRA	
	IOST	_IOSTB
	.line	65, "BSP\key.c"; 	set_PB_low();
	MCALL	_set_PB_low
	.line	66, "BSP\key.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3c
	IOST	_IOSTA
	.line	67, "BSP\key.c"; 	APHCON = 0xc3;
	MOVIA	0xc3
	IOST	_APHCON
	.line	68, "BSP\key.c"; 	KeyStatus = PORTA;
	MOVR	_PORTA,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	69, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x3C;
	MOVIA	0x3c
	ANDAR	r0x1002,F
	.line	70, "BSP\key.c"; 	switch(KeyStatus)
	MOVR	r0x1002,W
	XORIA	0x1c
	BTRSS	STATUS,2
	MGOTO	_02097_DS_
	MGOTO	_02025_DS_
_02097_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x2c
	BTRSS	STATUS,2
	MGOTO	_02098_DS_
	MGOTO	_02024_DS_
_02098_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x34
	BTRSS	STATUS,2
	MGOTO	_02099_DS_
	MGOTO	_02023_DS_
_02099_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x38
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	.line	72, "BSP\key.c"; 	case(0X38):	KeyValue=KeyValue;usart_send_string("A0111/r/n");break;
	MOVIA	((___str_5 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_5 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02029_DS_
_02023_DS_:
	.line	73, "BSP\key.c"; 	case(0X34):	KeyValue=KeyValue+0x04;usart_send_string("A1011/r/n");break;
	MOVIA	0x04
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
	MOVIA	((___str_6 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_6 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02029_DS_
_02024_DS_:
	.line	74, "BSP\key.c"; 	case(0X2C): KeyValue=KeyValue+0x08;usart_send_string("A1101/r/n");break;
	MOVIA	0x08
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
	MOVIA	((___str_7 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_7 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	MGOTO	_02029_DS_
_02025_DS_:
	.line	75, "BSP\key.c"; 	case(0X1C):	KeyValue=KeyValue+0x0c;usart_send_string("A1110/r/n");break;
	MOVIA	0x0c
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
	MOVIA	((___str_8 + 0) >> 8) & 0xff
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	(___str_8 + 0)
	BANKSEL	r0x1002
	MOVAR	r0x1002
	MOVIA	0x80
	BANKSEL	r0x1003
	MOVAR	r0x1003
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK01
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK00
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MCALL	_usart_send_string
	.line	76, "BSP\key.c"; 	}
	MGOTO	_02029_DS_
_02028_DS_:
	.line	89, "BSP\key.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02035_DS_
_02029_DS_:
	.line	91, "BSP\key.c"; 	APHCON = 0xff;
	MOVIA	0xff
	IOST	_APHCON
	.line	92, "BSP\key.c"; 	IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output;
	CLRA	
	IOST	_IOSTA
	.line	93, "BSP\key.c"; 	set_PA_low();
	MCALL	_set_PA_low
	.line	94, "BSP\key.c"; 	IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input;
	MOVIA	0x0f
	IOST	_IOSTB
	.line	95, "BSP\key.c"; 	BPHCON = 0x30;
	MOVIA	0x30
	MOVAR	_BPHCON
	.line	96, "BSP\key.c"; 	sCodeValue = KeyValue - 0x01;
	BANKSEL	r0x1001
	DECR	r0x1001,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	97, "BSP\key.c"; 	usart_send_string("sCodeValue:");usart_send_byte(sCodeValue);
	MOVIA	((___str_9 + 0) >> 8) & 0xff
	BANKSEL	r0x1003
	MOVAR	r0x1003
	MOVIA	(___str_9 + 0)
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVIA	0x80
	BANKSEL	r0x1005
	MOVAR	r0x1005
	BANKSEL	r0x1004
	MOVR	r0x1004,W
	MOVAR	STK01
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	MOVAR	STK00
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_usart_send_string
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MCALL	_usart_send_byte
	.line	99, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	.line	100, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1004,F
	.line	101, "BSP\key.c"; 	while(KeyStatus != 0x0F)     // 等待按键释放
	MOVR	r0x1004,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02100_DS_
	MGOTO	_02034_DS_
_02100_DS_:
	.line	105, "BSP\key.c"; 	PORTBbits.PB4 = 1;
	BSR	_PORTBbits,4
	.line	106, "BSP\key.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	107, "BSP\key.c"; 	PORTBbits.PB4 = 0;
	BCR	_PORTBbits,4
	.line	108, "BSP\key.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	109, "BSP\key.c"; 	PORTBbits.PB4 = 1;
	BSR	_PORTBbits,4
	.line	110, "BSP\key.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	111, "BSP\key.c"; 	PORTBbits.PB4 = 0;
	BCR	_PORTBbits,4
	.line	112, "BSP\key.c"; 	delay_ms(2);
	MOVIA	0x02
	MCALL	_delay_ms
	.line	116, "BSP\key.c"; 	send_ble_packet(sCodeValue);
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MCALL	_send_ble_packet
	.line	117, "BSP\key.c"; 	SLEEP_STATUS = 1;
	MOVIA	0x01
	BANKSEL	_SLEEP_STATUS
	MOVAR	_SLEEP_STATUS
	.line	118, "BSP\key.c"; 	return KeyValue;
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	MGOTO	_02035_DS_
_02034_DS_:
	.line	121, "BSP\key.c"; 	return 0;
	MOVIA	0x00
_02035_DS_:
	.line	122, "BSP\key.c"; 	}
	RETURN	
; exit point of _Check_Keydown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _set_PA_low
;   _set_PA_low
;; Starting pCode block
.segment "code"; module=key, function=_key_init
	.debuginfo subprogram _key_init
_key_init:
; 2 exit points
	.line	27, "BSP\key.c"; 	IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output; //| C_PA6_Input | C_PA7_Input;
	CLRA	
	IOST	_IOSTA
	.line	29, "BSP\key.c"; 	set_PA_low();
	MCALL	_set_PA_low
	.line	32, "BSP\key.c"; 	IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Output;
	MOVIA	0x0f
	IOST	_IOSTB
	.line	33, "BSP\key.c"; 	BPHCON = 0x30;
	MOVIA	0x30
	MOVAR	_BPHCON
	.line	35, "BSP\key.c"; 	PORTBbits.PB4 = 0;
	BCR	_PORTBbits,4
	.line	37, "BSP\key.c"; 	}
	RETURN	
; exit point of _key_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=key, function=_set_PB_low
	.debuginfo subprogram _set_PB_low
_set_PB_low:
; 2 exit points
	.line	18, "BSP\key.c"; 	PORTBbits.PB0 = 0;
	BCR	_PORTBbits,0
	.line	19, "BSP\key.c"; 	PORTBbits.PB1 = 0;
	BCR	_PORTBbits,1
	.line	20, "BSP\key.c"; 	PORTBbits.PB2 = 0;
	BCR	_PORTBbits,2
	.line	21, "BSP\key.c"; 	PORTBbits.PB3 = 0;
	BCR	_PORTBbits,3
	.line	22, "BSP\key.c"; 	}
	RETURN	
; exit point of _set_PB_low

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=key, function=_set_PA_low
	.debuginfo subprogram _set_PA_low
_set_PA_low:
; 2 exit points
	.line	11, "BSP\key.c"; 	PORTAbits.PA2 = 0;
	BCR	_PORTAbits,2
	.line	12, "BSP\key.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	13, "BSP\key.c"; 	PORTAbits.PA4 = 0;
	BCR	_PORTAbits,4
	.line	14, "BSP\key.c"; 	PORTAbits.PA5 = 0;
	BCR	_PORTAbits,5
	.line	15, "BSP\key.c"; 	}
	RETURN	
; exit point of _set_PA_low


;	code size estimation:
;	  277+   86 =   363 instructions (  898 byte)

	end
