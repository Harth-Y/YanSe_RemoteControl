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
	extern	_toggle_key
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
r0x1002:
	.res	1
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
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
; code_key	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _toggle_key
;   _key_init
;   _send_ble_packet
;   _delay_250ms
;   _delay_ms
;   _key_init
;   _delay_us
;   _toggle_key
;   _key_init
;   _send_ble_packet
;   _delay_250ms
;   _delay_ms
;   _key_init
;6 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;   r0x1003
;   STK00
;   r0x1004
;; Starting pCode block
.segment "code"; module=key, function=_Check_Keydown
	.debuginfo subprogram _Check_Keydown
;local variable name mapping:
	.debuginfo complex-type (local-sym "_KeyValue" 1 "BSP\key.c" 55 (basetype 1 unsigned) split "r0x1000")
	.debuginfo complex-type (local-sym "_KeyStatus" 1 "BSP\key.c" 57 (basetype 1 unsigned) split "r0x1001")
	.debuginfo complex-type (local-sym "_sCodeValue" 1 "BSP\key.c" 56 (basetype 1 unsigned) split "r0x1000")
	.debuginfo complex-type (local-sym "_led_status" 1 "BSP\key.c" 108 (basetype 1 unsigned) split "r0x1001")
	.debuginfo complex-type (local-sym "_keydown_times" 1 "BSP\key.c" 109 (basetype 1 unsigned) split "r0x1002")
_Check_Keydown:
; 2 exit points
	.line	55, "BSP\key.c"; 	unsigned char KeyValue=0;
	BANKSEL	r0x1000
	CLRR	r0x1000
	.line	59, "BSP\key.c"; 	KeyStatus = PORTA;
	MOVR	_PORTA,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	60, "BSP\key.c"; 	KeyStatus = KeyStatus & 0xfc;
	MOVIA	0xfc
	ANDAR	r0x1001,F
	.line	62, "BSP\key.c"; 	if(KeyStatus != 0xfc)
	MOVR	r0x1001,W
	XORIA	0xfc
	BTRSS	STATUS,2
	MGOTO	_02130_DS_
	MGOTO	_02047_DS_
_02130_DS_:
	.line	64, "BSP\key.c"; 	delay_us(100);
	MOVIA	0x64
	MCALL	_delay_us
	.line	65, "BSP\key.c"; 	KeyStatus = PORTA;
	MOVR	_PORTA,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	66, "BSP\key.c"; 	KeyStatus = KeyStatus & 0xfc;
	MOVIA	0xfc
	ANDAR	r0x1001,F
	.line	68, "BSP\key.c"; 	if(KeyStatus != 0xfc)
	MOVR	r0x1001,W
	XORIA	0xfc
	BTRSS	STATUS,2
	MGOTO	_02131_DS_
	MGOTO	_02036_DS_
_02131_DS_:
	.line	70, "BSP\key.c"; 	if(!PORTAbits.PA6)
	BTRSC	_PORTAbits,6
	MGOTO	_02022_DS_
	.line	72, "BSP\key.c"; 	KeyValue=0x11;
	MOVIA	0x11
	BANKSEL	r0x1000
	MOVAR	r0x1000
_02022_DS_:
	.line	74, "BSP\key.c"; 	if(!PORTAbits.PA7)
	BTRSC	_PORTAbits,7
	MGOTO	_02024_DS_
	.line	76, "BSP\key.c"; 	KeyValue=0x12;
	MOVIA	0x12
	BANKSEL	r0x1000
	MOVAR	r0x1000
_02024_DS_:
	.line	79, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x3c;
	MOVIA	0x3c
	BANKSEL	r0x1001
	ANDAR	r0x1001,F
	.line	81, "BSP\key.c"; 	switch(KeyStatus)
	MOVR	r0x1001,W
	XORIA	0x1c
	BTRSS	STATUS,2
	MGOTO	_02132_DS_
	MGOTO	_02028_DS_
_02132_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x2c
	BTRSS	STATUS,2
	MGOTO	_02133_DS_
	MGOTO	_02027_DS_
_02133_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x34
	BTRSS	STATUS,2
	MGOTO	_02134_DS_
	MGOTO	_02026_DS_
_02134_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x38
	BTRSS	STATUS,2
	MGOTO	_02029_DS_
	.line	83, "BSP\key.c"; 	case(0X38): KeyValue=0x01;break;
	MOVIA	0x01
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MGOTO	_02029_DS_
_02026_DS_:
	.line	84, "BSP\key.c"; 	case(0X34): KeyValue=0x02;break;
	MOVIA	0x02
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MGOTO	_02029_DS_
_02027_DS_:
	.line	85, "BSP\key.c"; 	case(0X2C): KeyValue=0x03;break;
	MOVIA	0x03
	BANKSEL	r0x1000
	MOVAR	r0x1000
	MGOTO	_02029_DS_
_02028_DS_:
	.line	86, "BSP\key.c"; 	case(0X1C): KeyValue=0x04;break;
	MOVIA	0x04
	BANKSEL	r0x1000
	MOVAR	r0x1000
_02029_DS_:
	.line	89, "BSP\key.c"; 	toggle_key();
	MCALL	_toggle_key
	.line	91, "BSP\key.c"; 	KeyStatus = PORTB;
	MOVR	_PORTB,W
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	92, "BSP\key.c"; 	KeyStatus = KeyStatus & 0x0f;
	MOVIA	0x0f
	ANDAR	r0x1001,F
	.line	94, "BSP\key.c"; 	switch(KeyStatus)
	MOVR	r0x1001,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_02135_DS_
	MGOTO	_02037_DS_
_02135_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x0b
	BTRSS	STATUS,2
	MGOTO	_02136_DS_
	MGOTO	_02031_DS_
_02136_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x0d
	BTRSS	STATUS,2
	MGOTO	_02137_DS_
	MGOTO	_02032_DS_
_02137_DS_:
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	XORIA	0x0e
	BTRSS	STATUS,2
	MGOTO	_02138_DS_
	MGOTO	_02033_DS_
_02138_DS_:
	MGOTO	_02037_DS_
_02031_DS_:
	.line	97, "BSP\key.c"; 	case(0x0B): KeyValue=KeyValue+0x04;break;
	MOVIA	0x04
	BANKSEL	r0x1000
	ADDAR	r0x1000,F
	MGOTO	_02037_DS_
_02032_DS_:
	.line	98, "BSP\key.c"; 	case(0x0D): KeyValue=KeyValue+0x08;break;
	MOVIA	0x08
	BANKSEL	r0x1000
	ADDAR	r0x1000,F
	MGOTO	_02037_DS_
_02033_DS_:
	.line	99, "BSP\key.c"; 	case(0x0E): KeyValue=KeyValue+0x0c;break;
	MOVIA	0x0c
	BANKSEL	r0x1000
	ADDAR	r0x1000,F
	.line	100, "BSP\key.c"; 	}
	MGOTO	_02037_DS_
_02036_DS_:
	.line	104, "BSP\key.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02048_DS_
_02037_DS_:
	.line	107, "BSP\key.c"; 	sCodeValue = KeyValue - 0x01;
	BANKSEL	r0x1000
	DECR	r0x1000,F
	.line	108, "BSP\key.c"; 	unsigned char led_status = 1;
	MOVIA	0x01
	BANKSEL	r0x1001
	MOVAR	r0x1001
	.line	109, "BSP\key.c"; 	unsigned char keydown_times = 1;
	MOVIA	0x01
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	111, "BSP\key.c"; 	key_init();
	MCALL	_key_init
	.line	113, "BSP\key.c"; 	KeyStatus = PORTA;
	MOVR	_PORTA,W
	BANKSEL	r0x1003
	MOVAR	r0x1003
	.line	114, "BSP\key.c"; 	KeyStatus = KeyStatus & 0xfc;
	MOVIA	0xfc
	ANDAR	r0x1003,F
_02043_DS_:
	.line	115, "BSP\key.c"; 	while(KeyStatus)
	BANKSEL	r0x1003
	MOVR	r0x1003,W
	BTRSC	STATUS,2
	MGOTO	_02045_DS_
	.line	117, "BSP\key.c"; 	CLRWDT();
	clrwdt
	.line	118, "BSP\key.c"; 	send_ble_packet(sCodeValue, keydown_times);
	BANKSEL	r0x1002
	MOVR	r0x1002,W
	MOVAR	STK00
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	MCALL	_send_ble_packet
	.line	119, "BSP\key.c"; 	keydown_times = 0;
	BANKSEL	r0x1002
	CLRR	r0x1002
	.line	120, "BSP\key.c"; 	if(led_status != 0)
	BANKSEL	r0x1001
	MOVR	r0x1001,W
	BTRSC	STATUS,2
	MGOTO	_02039_DS_
	.line	122, "BSP\key.c"; 	led_status = 0;
	CLRR	r0x1001
	.line	123, "BSP\key.c"; 	delay_250ms();
	MCALL	_delay_250ms
	.line	124, "BSP\key.c"; 	CLRWDT();
	clrwdt
	MGOTO	_02040_DS_
_02039_DS_:
	.line	128, "BSP\key.c"; 	delay_ms(90);
	MOVIA	0x5a
	MCALL	_delay_ms
_02040_DS_:
	.line	130, "BSP\key.c"; 	key_init();
	MCALL	_key_init
	.line	131, "BSP\key.c"; 	if(KeyStatus != (PORTA & 0xfc))
	MOVIA	0xfc
	ANDAR	_PORTA,W
	BANKSEL	r0x1004
	MOVAR	r0x1004
	MOVR	r0x1004,W
	BANKSEL	r0x1003
	XORAR	r0x1003,W
	BTRSS	STATUS,2
	MGOTO	_02139_DS_
	MGOTO	_02043_DS_
_02139_DS_:
	.line	133, "BSP\key.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02048_DS_
_02045_DS_:
	.line	136, "BSP\key.c"; 	return 0;
	MOVIA	0x00
	MGOTO	_02048_DS_
_02047_DS_:
	.line	138, "BSP\key.c"; 	return 1;
	MOVIA	0x01
_02048_DS_:
	.line	139, "BSP\key.c"; 	}
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
.segment "code"; module=key, function=_toggle_key
	.debuginfo subprogram _toggle_key
_toggle_key:
; 2 exit points
	.line	44, "BSP\key.c"; 	APHCON = 0b00111111; // 2、3、4上拉取消
	MOVIA	0x3f
	IOST	_APHCON
	.line	45, "BSP\key.c"; 	PCON = 0xe8; // 5上拉取消
	MOVIA	0xe8
	MOVAR	_PCON
	.line	46, "BSP\key.c"; 	IOSTA = 0b11000000; // 配置PA2、3、4、5为输出低电平
	MOVIA	0xc0
	IOST	_IOSTA
	.line	47, "BSP\key.c"; 	set_PA_low();
	MCALL	_set_PA_low
	.line	49, "BSP\key.c"; 	IOSTB = 0b00001111; // 配置PB0、1、2、3为输入
	MOVIA	0x0f
	IOST	_IOSTB
	.line	50, "BSP\key.c"; 	BPHCON = 0xF0; // 0、1、2、3上拉
	MOVIA	0xf0
	MOVAR	_BPHCON
	.line	51, "BSP\key.c"; 	}
	RETURN	
; exit point of _toggle_key

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ms
;   _set_PB_low
;   _delay_ms
;   _set_PB_low
;; Starting pCode block
.segment "code"; module=key, function=_key_init
	.debuginfo subprogram _key_init
_key_init:
; 2 exit points
	.line	29, "BSP\key.c"; 	delay_ms(1);
	MOVIA	0x01
	MCALL	_delay_ms
	.line	31, "BSP\key.c"; 	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	MOVIA	0xfc
	IOST	_IOSTA
	.line	33, "BSP\key.c"; 	APHCON = 0b00100011; // 设置2、3、4、6、7上拉
	MOVIA	0x23
	IOST	_APHCON
	.line	35, "BSP\key.c"; 	PCON = 0xc8; // 设置5上拉
	MOVIA	0xc8
	MOVAR	_PCON
	.line	38, "BSP\key.c"; 	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output | C_PB4_Output; // 配置PB为输出低电平
	CLRA	
	IOST	_IOSTB
	.line	39, "BSP\key.c"; 	set_PB_low();
	MCALL	_set_PB_low
	.line	40, "BSP\key.c"; 	PORTBbits.PB4 = 0;
	BCR	_PORTBbits,4
	.line	41, "BSP\key.c"; 	}
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
	.line	21, "BSP\key.c"; 	PORTBbits.PB0 = 0;
	BCR	_PORTBbits,0
	.line	22, "BSP\key.c"; 	PORTBbits.PB1 = 0;
	BCR	_PORTBbits,1
	.line	23, "BSP\key.c"; 	PORTBbits.PB2 = 0;
	BCR	_PORTBbits,2
	.line	24, "BSP\key.c"; 	PORTBbits.PB3 = 0;
	BCR	_PORTBbits,3
	.line	25, "BSP\key.c"; 	}
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
	.line	14, "BSP\key.c"; 	PORTAbits.PA2 = 0;
	BCR	_PORTAbits,2
	.line	15, "BSP\key.c"; 	PORTAbits.PA3 = 0;
	BCR	_PORTAbits,3
	.line	16, "BSP\key.c"; 	PORTAbits.PA4 = 0;
	BCR	_PORTAbits,4
	.line	17, "BSP\key.c"; 	PORTAbits.PA5 = 0;
	BCR	_PORTAbits,5
	.line	18, "BSP\key.c"; 	}
	RETURN	
; exit point of _set_PA_low


;	code size estimation:
;	  174+   31 =   205 instructions (  472 byte)

	end
