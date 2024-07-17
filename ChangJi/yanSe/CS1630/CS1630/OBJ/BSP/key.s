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
r0x1003:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_SLEEP_STATUS:
	.debuginfo complex-type (symbol "_SLEEP_STATUS" 1 global "BSP\key.c" 6 (basetype 1 unsigned))

	dw	0x01	; 1

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
;   _set_PB_low
;   _set_PA_low
;   _send_ble_packet
;   _delay_ms
;   _set_PB_low
;   _set_PA_low
;   _send_ble_packet
;3 compiler assigned registers:
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
.segment "code"; module=key, function=_Check_Keydown
	.debuginfo subprogram _Check_Keydown
;local variable name mapping:
	.debuginfo complex-type (local-sym "_KeyValue" 1 "BSP\key.c" 39 (basetype 1 unsigned) split "r0x1001")
	.debuginfo complex-type (local-sym "_KeyStatus" 1 "BSP\key.c" 41 (basetype 1 unsigned) split "r0x1002")
	.debuginfo complex-type (local-sym "_sCodeValue" 1 "BSP\key.c" 40 (basetype 1 unsigned) split "r0x1002")
_Check_Keydown:
; 2 exit points
	.line	39, "BSP\key.c"; 	unsigned char KeyValue=0;
	BANKSEL	r0x1001
	CLRR	r0x1001
	.line	43, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	44, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1002,F
	.line	45, "BSP\key.c"; 	if(KeyStatus != 0x0f)
	MOVR	r0x1002,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02102_DS_
	MGOTO	_02038_DS_
_02102_DS_:
	.line	47, "BSP\key.c"; 	delay_ms(10);
	MOVIA	0x0a
	MCALL	_delay_ms
	.line	48, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	49, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1002,F
	.line	50, "BSP\key.c"; 	if(KeyStatus != 0x0f)
	MOVR	r0x1002,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02103_DS_
	MGOTO	_02032_DS_
_02103_DS_:
	.line	52, "BSP\key.c"; 	SLEEP_STATUS = 0;
	BANKSEL	_SLEEP_STATUS
	CLRR	_SLEEP_STATUS
	.line	53, "BSP\key.c"; 	switch(KeyStatus)
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_02104_DS_
	MGOTO	_02020_DS_
_02104_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0b
	BTRSS	STATUS,2
	MGOTO	_02105_DS_
	MGOTO	_02019_DS_
_02105_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0d
	BTRSS	STATUS,2
	MGOTO	_02106_DS_
	MGOTO	_02018_DS_
_02106_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x0e
	BTRSS	STATUS,2
	MGOTO	_02021_DS_
	.line	55, "BSP\key.c"; 	case(0X0e):	KeyValue=0x01;break;
	MOVIA	0x01
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MGOTO	_02021_DS_
_02018_DS_:
	.line	56, "BSP\key.c"; 	case(0X0d):	KeyValue=0x02;break;
	MOVIA	0x02
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MGOTO	_02021_DS_
_02019_DS_:
	.line	57, "BSP\key.c"; 	case(0X0b): KeyValue=0x03;break;
	MOVIA	0x03
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MGOTO	_02021_DS_
_02020_DS_:
	.line	58, "BSP\key.c"; 	case(0X07):	KeyValue=0x04;break;
	MOVIA	0x04
	BANKSEL	r0x1001
	MOVAR	r0x1001
_02021_DS_:
	.line	60, "BSP\key.c"; 	BPHCON = 0x3F;
	MOVIA	0x3f
	MOVAR	_BPHCON
	.line	61, "BSP\key.c"; 	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output;
	CLRA	
	IOST	_IOSTB
	.line	62, "BSP\key.c"; 	set_PB_low();
	MCALL	_set_PB_low
	.line	63, "BSP\key.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
	MOVIA	0x3c
	IOST	_IOSTA
	.line	64, "BSP\key.c"; 	APHCON = 0xc3;
	MOVIA	0xc3
	IOST	_APHCON
	.line	65, "BSP\key.c"; 	KeyStatus = PORTA;
	MOVR	_PORTA,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	66, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x3C;
	MOVIA	0x3c
	ANDAR	r0x1002,F
	.line	67, "BSP\key.c"; 	switch(KeyStatus)
	MOVR	r0x1002,W
	XORIA	0x1c
	BTRSS	STATUS,2
	MGOTO	_02107_DS_
	MGOTO	_02025_DS_
_02107_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x2c
	BTRSS	STATUS,2
	MGOTO	_02108_DS_
	MGOTO	_02024_DS_
_02108_DS_:
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	XORIA	0x34
	BTRSS	STATUS,2
	MGOTO	_02026_DS_
	.line	70, "BSP\key.c"; 	case(0X34):	KeyValue=KeyValue+0x04;break;
	MOVIA	0x04
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
	MGOTO	_02026_DS_
_02024_DS_:
	.line	71, "BSP\key.c"; 	case(0X2C): KeyValue=KeyValue+0x08;break;
	MOVIA	0x08
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
	MGOTO	_02026_DS_
_02025_DS_:
	.line	72, "BSP\key.c"; 	case(0X1C):	KeyValue=KeyValue+0x0c;break;
	MOVIA	0x0c
	BANKSEL	r0x1001
	ADDAR	r0x1001,F
_02026_DS_:
	.line	76, "BSP\key.c"; 	if(PORTAbits.PA6)
	BTRSS	_PORTAbits,6
	MGOTO	_02028_DS_
	.line	78, "BSP\key.c"; 	KeyValue = 0x11;
	MOVIA	0x11
	BANKSEL	r0x1001
	MOVAR	r0x1001
_02028_DS_:
	.line	80, "BSP\key.c"; 	if(PORTAbits.PA7)
	BTRSS	_PORTAbits,7
	MGOTO	_02033_DS_
	.line	82, "BSP\key.c"; 	KeyValue = 0x12;
	MOVIA	0x12
	BANKSEL	r0x1001
	MOVAR	r0x1001
	MGOTO	_02033_DS_
_02032_DS_:
	.line	87, "BSP\key.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02039_DS_
_02033_DS_:
	.line	89, "BSP\key.c"; 	APHCON = 0xff;
	MOVIA	0xff
	IOST	_APHCON
	.line	90, "BSP\key.c"; 	IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output;
	CLRA	
	IOST	_IOSTA
	.line	91, "BSP\key.c"; 	set_PA_low();
	MCALL	_set_PA_low
	.line	92, "BSP\key.c"; 	IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input;
	MOVIA	0x0f
	IOST	_IOSTB
	.line	93, "BSP\key.c"; 	BPHCON = 0x30;
	MOVIA	0x30
	MOVAR	_BPHCON
	.line	94, "BSP\key.c"; 	sCodeValue = KeyValue - 0x01;
	BANKSEL	r0x1001
	DECR	r0x1001,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	97, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	.line	98, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0F;
	MOVIA	0x0f
	ANDAR	r0x1003,F
	.line	99, "BSP\key.c"; 	while(KeyStatus != 0x0F)     // 等待按键释放
	MOVR	r0x1003,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02109_DS_
	MGOTO	_02038_DS_
_02109_DS_:
	.line	104, "BSP\key.c"; 	send_ble_packet(sCodeValue);
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MCALL	_send_ble_packet
	.line	105, "BSP\key.c"; 	SLEEP_STATUS = 1;
	MOVIA	0x01
	BANKSEL	_SLEEP_STATUS
	MOVAR	_SLEEP_STATUS
	.line	106, "BSP\key.c"; 	return KeyValue;
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	MGOTO	_02039_DS_
_02038_DS_:
	.line	109, "BSP\key.c"; 	return 0;
	MOVIA	0x00
_02039_DS_:
	.line	110, "BSP\key.c"; 	}
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
	.line	26, "BSP\key.c"; 	IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output | C_PA6_Input | C_PA7_Input;
	MOVIA	0xc0
	IOST	_IOSTA
	.line	27, "BSP\key.c"; 	set_PA_low();
	MCALL	_set_PA_low
	.line	30, "BSP\key.c"; 	IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Output;
	MOVIA	0x0f
	IOST	_IOSTB
	.line	31, "BSP\key.c"; 	BPHCON = 0x30;
	MOVIA	0x30
	MOVAR	_BPHCON
	.line	33, "BSP\key.c"; 	PORTBbits.PB4 = 0;
	BCR	_PORTBbits,4
	.line	35, "BSP\key.c"; 	}
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
	.line	17, "BSP\key.c"; 	PORTBbits.PB0 = 0;
	BCR	_PORTBbits,0
	.line	18, "BSP\key.c"; 	PORTBbits.PB1 = 0;
	BCR	_PORTBbits,1
	.line	19, "BSP\key.c"; 	PORTBbits.PB2 = 0;
	BCR	_PORTBbits,2
	.line	20, "BSP\key.c"; 	PORTBbits.PB3 = 0;
	BCR	_PORTBbits,3
	.line	21, "BSP\key.c"; 	}
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
	.line	10, "BSP\key.c"; 	PORTAbits.PA2 = 0;
	BCR	_PORTAbits,2
	.line	11, "BSP\key.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	12, "BSP\key.c"; 	PORTAbits.PA4 = 0;
	BCR	_PORTAbits,4
	.line	13, "BSP\key.c"; 	PORTAbits.PA5 = 0;
	BCR	_PORTAbits,5
	.line	14, "BSP\key.c"; 	}
	RETURN	
; exit point of _set_PA_low


;	code size estimation:
;	  145+   26 =   171 instructions (  394 byte)

	end
