;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\bsp_spi.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_usart_send_string
	extern	_usart_send_byte
	extern	_usart_init
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
	extern	_RF_spi_wrd
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
	extern	_RF_softSPI_Init
	extern	_SPI_SendByte
	extern	_SPI_ReadByte

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
r0x1008:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
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
; code_bsp_spi	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
.segment "code"; module=bsp_spi, function=_SPI_ReadByte
	.debuginfo subprogram _SPI_ReadByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_byte" 1 "BSP\bsp_spi.c" 73 (basetype 1 unsigned) split "r0x1000")
	.debuginfo complex-type (local-sym "_bit_ctr" 1 "BSP\bsp_spi.c" 72 (basetype 1 unsigned) split "r0x1001")
	.debuginfo complex-type (local-sym "_temp" 1 "BSP\bsp_spi.c" 74 (bit 5 1) split "r0x1003")
_SPI_ReadByte:
; 2 exit points
	.line	73, "BSP\bsp_spi.c"; 	unsigned char byte = 0;
	BANKSEL	r0x1000
	CLRR	r0x1000
	.line	76, "BSP\bsp_spi.c"; 	IOSTB = C_PB5_Input;
	MOVIA	0x20
	IOST	_IOSTB
	.line	78, "BSP\bsp_spi.c"; 	for(bit_ctr = 0;bit_ctr < 8;bit_ctr ++) // output 8-bit
	BANKSEL	r0x1001
	CLRR	r0x1001
_02070_DS_:
	.line	80, "BSP\bsp_spi.c"; 	byte = byte << 1;
	BCR	STATUS,0
	BANKSEL	r0x1000
	RLR	r0x1000,W
	BANKSEL	r0x1002
	MOVAR	r0x1002
	.line	81, "BSP\bsp_spi.c"; 	RF_SCK_H();
	nop
	nop
	nop
	BSR	_PORTAbits,0
	nop
	nop
	nop
	.line	82, "BSP\bsp_spi.c"; 	temp = RF_Reag_SDIO();
	BANKSEL	r0x1003
	CLRR	r0x1003
	BTRSC	_PORTBbits,5
	INCR	r0x1003,F
	.line	83, "BSP\bsp_spi.c"; 	byte |= temp;
	MOVR	r0x1003,W
	BANKSEL	r0x1002
	IORAR	r0x1002,W
	BANKSEL	r0x1000
	MOVAR	r0x1000
	.line	84, "BSP\bsp_spi.c"; 	RF_SCK_L();
	nop
	nop
	nop
	BCR	_PORTAbits,0
	nop
	nop
	nop
	.line	85, "BSP\bsp_spi.c"; 	NOP();
	nop
	.line	78, "BSP\bsp_spi.c"; 	for(bit_ctr = 0;bit_ctr < 8;bit_ctr ++) // output 8-bit
	BANKSEL	r0x1001
	INCR	r0x1001,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1001,W
	BTRSS	STATUS,0
	MGOTO	_02070_DS_
	.line	88, "BSP\bsp_spi.c"; 	return (byte); // return read byte
	BANKSEL	r0x1000
	MOVR	r0x1000,W
	.line	89, "BSP\bsp_spi.c"; 	}
	RETURN	
; exit point of _SPI_ReadByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
.segment "code"; module=bsp_spi, function=_SPI_SendByte
	.debuginfo subprogram _SPI_SendByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_TxData" 1 "BSP\bsp_spi.c" 41 (basetype 1 unsigned) split "r0x1004")
	.debuginfo complex-type (local-sym "_i" 2 "BSP\bsp_spi.c" 43 (basetype 2 signed) split "r0x1005" "r0x1006")
	.debuginfo complex-type (local-sym "_data_output_bit" 1 "BSP\bsp_spi.c" 44 (basetype 1 unsigned) split "r0x1007")
_SPI_SendByte:
; 2 exit points
	.line	41, "BSP\bsp_spi.c"; 	void SPI_SendByte(unsigned char TxData)
	BANKSEL	r0x1004
	MOVAR	r0x1004
	.line	45, "BSP\bsp_spi.c"; 	IOSTB = C_PB5_Output;
	CLRA	
	IOST	_IOSTB
	.line	47, "BSP\bsp_spi.c"; 	for(i = 0; i < 8; i ++)
	BANKSEL	r0x1005
	CLRR	r0x1005
	BANKSEL	r0x1006
	CLRR	r0x1006
_02035_DS_:
	.line	49, "BSP\bsp_spi.c"; 	data_output_bit = TxData & 0x80 ? 1 : 0;
	BANKSEL	r0x1004
	BTRSS	r0x1004,7
	MGOTO	_02039_DS_
	MOVIA	0x01
	BANKSEL	r0x1007
	MOVAR	r0x1007
	MGOTO	_02040_DS_
_02039_DS_:
	BANKSEL	r0x1007
	CLRR	r0x1007
_02040_DS_:
	.line	50, "BSP\bsp_spi.c"; 	RF_SCK_L();
	nop
	nop
	nop
	BCR	_PORTAbits,0
	nop
	nop
	nop
	.line	51, "BSP\bsp_spi.c"; 	if(data_output_bit)
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	BTRSC	STATUS,2
	MGOTO	_02019_DS_
	.line	53, "BSP\bsp_spi.c"; 	RF_SDIO_H();
	nop
	nop
	nop
	BSR	_PORTBbits,5
	nop
	nop
	nop
	MGOTO	_02025_DS_
_02019_DS_:
	.line	57, "BSP\bsp_spi.c"; 	RF_SDIO_L();
	nop
	nop
	nop
	BCR	_PORTBbits,5
	nop
	nop
	nop
_02025_DS_:
	.line	59, "BSP\bsp_spi.c"; 	RF_SCK_H();
	nop
	nop
	nop
	BSR	_PORTAbits,0
	nop
	nop
	nop
	.line	60, "BSP\bsp_spi.c"; 	NOP_DELAY();
	nop
	nop
	nop
	.line	61, "BSP\bsp_spi.c"; 	TxData = TxData << 1;
	BCR	STATUS,0
	BANKSEL	r0x1004
	RLR	r0x1004,F
	.line	47, "BSP\bsp_spi.c"; 	for(i = 0; i < 8; i ++)
	BANKSEL	r0x1005
	INCR	r0x1005,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1006
	INCR	r0x1006,F
;;signed compare: left < lit(0x8=8), size=2, mask=ffff
_00001_DS_:
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	ADDIA	0x80
	ADDIA	0x80
	BTRSS	STATUS,2
	MGOTO	_02058_DS_
	MOVIA	0x08
	BANKSEL	r0x1005
	SUBAR	r0x1005,W
_02058_DS_:
	BTRSS	STATUS,0
	MGOTO	_02035_DS_
	.line	64, "BSP\bsp_spi.c"; 	RF_SDIO_L();
	nop
	nop
	nop
	BCR	_PORTBbits,5
	nop
	nop
	nop
	.line	65, "BSP\bsp_spi.c"; 	RF_SCK_L();
	nop
	nop
	nop
	BCR	_PORTAbits,0
	nop
	nop
	nop
	.line	67, "BSP\bsp_spi.c"; 	NOP_DELAY();NOP_DELAY();NOP_DELAY();
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.line	68, "BSP\bsp_spi.c"; 	}
	RETURN	
; exit point of _SPI_SendByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _SPI_ReadByte
;   _SPI_SendByte
;   _SPI_ReadByte
;1 compiler assigned register :
;   r0x1008
;; Starting pCode block
.segment "code"; module=bsp_spi, function=_RF_spi_wrd
	.debuginfo subprogram _RF_spi_wrd
;local variable name mapping:
	.debuginfo complex-type (local-sym "_Data" 1 "BSP\bsp_spi.c" 31 (basetype 1 unsigned) split "r0x1008")
	.debuginfo complex-type (local-sym "_dt" 1 "BSP\bsp_spi.c" 33 (basetype 1 unsigned) split "r0x1008")
_RF_spi_wrd:
; 2 exit points
	.line	31, "BSP\bsp_spi.c"; 	unsigned char RF_spi_wrd(unsigned char Data)
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	36, "BSP\bsp_spi.c"; 	SPI_SendByte(dts);
	MOVR	r0x1008,W
	MCALL	_SPI_SendByte
	.line	37, "BSP\bsp_spi.c"; 	dt = SPI_ReadByte();
	MCALL	_SPI_ReadByte
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	38, "BSP\bsp_spi.c"; 	return dt;
	MOVR	r0x1008,W
	.line	39, "BSP\bsp_spi.c"; 	}
	RETURN	
; exit point of _RF_spi_wrd

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=bsp_spi, function=_RF_softSPI_Init
	.debuginfo subprogram _RF_softSPI_Init
_RF_softSPI_Init:
; 2 exit points
	.line	23, "BSP\bsp_spi.c"; 	IOSTA = C_PA0_Output; // SCK
	CLRA	
	IOST	_IOSTA
	.line	24, "BSP\bsp_spi.c"; 	IOSTA = C_PA1_Output; // CSN
	CLRA	
	IOST	_IOSTA
	.line	25, "BSP\bsp_spi.c"; 	IOSTB = C_PB5_Output; // SDA
	CLRA	
	IOST	_IOSTB
	.line	28, "BSP\bsp_spi.c"; 	RF_CSN_L();
	nop
	nop
	nop
	BCR	_PORTAbits,1
	nop
	nop
	nop
	.line	29, "BSP\bsp_spi.c"; 	}
	RETURN	
; exit point of _RF_softSPI_Init


;	code size estimation:
;	   74+   23 =    97 instructions (  240 byte)

	end
