;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\bsp_cs1630.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_get_rolling_code_3
	extern	_get_rolling_code_2
	extern	_get_rolling_code_1
	extern	_get_rolling_code_0
	extern	_usart_send_string
	extern	_usart_send_byte
	extern	_usart_init
	extern	_delay_40us
	extern	_delay_us
	extern	_delay_250ms
	extern	_delay_ms
	extern	_CS1630_Dump_RF_Register
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
	extern	_multi_8b
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
	extern	__gptrput1
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
	extern	_CS1630_wr_cmd
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
	extern	_CS1630_Soft_Rst
	extern	_CS1630_Init
	extern	_CS1630_read_buffer
	extern	_CS1630_read_byte
	extern	_CS1630_write_byte
	extern	_CS1630_wr_buffer
	extern	_CS1630_Bank_Switch
	extern	_CS1630_SendPack
	extern	_CS1630_ModeSwitch
	extern	_CS1630_Clear_All_Irq
	extern	_CS1630_Flush_Tx
	extern	_CS1630_CE_High
	extern	_CS1630_CE_Low
	extern	_Enter_sleep

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
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x1013:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x1010:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
_CS1630_Soft_Rst_soft_temp_65536_61:
	.res	4
	.debuginfo complex-type (symbol "_CS1630_Soft_Rst_soft_temp_65536_61" 4 global "" 0 (basetype 4 unsigned))
.segment "uninit"
_CS1630_Init_temp_65536_63:
	.res	5
	.debuginfo complex-type (symbol "_CS1630_Init_temp_65536_63" 5 global "" 0 (basetype 5 unsigned))
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
; code_bsp_cs1630	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _CS1630_read_byte
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;2 compiler assigned registers:
;   r0x100A
;   r0x100B
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_Enter_sleep
	.debuginfo subprogram _Enter_sleep
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ret" 1 "BSP\bsp_cs1630.c" 232 (basetype 1 unsigned) split "r0x100A")
_Enter_sleep:
; 2 exit points
	.line	236, "BSP\bsp_cs1630.c"; 	ret = CS1630_read_byte(CS1630_BANK0_CONFIG);
	MOVIA	0x00
	MCALL	_CS1630_read_byte
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	237, "BSP\bsp_cs1630.c"; 	ret &= ~0x02;
	BCR	r0x100A,1
	.line	238, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	239, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_W_REGISTER | CS1630_BANK0_CONFIG);
	MOVIA	0x20
	MCALL	_SPI_SendByte
	.line	240, "BSP\bsp_cs1630.c"; 	SPI_SendByte(ret);
	BANKSEL	r0x100A
	MOVR	r0x100A,W
	MCALL	_SPI_SendByte
	.line	242, "BSP\bsp_cs1630.c"; 	IOSTB = C_PB5_Input;
	MOVIA	0x20
	IOST	_IOSTB
	.line	244, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	246, "BSP\bsp_cs1630.c"; 	delay_us(10);
	MOVIA	0x0a
	MCALL	_delay_us
_02089_DS_:
	.line	248, "BSP\bsp_cs1630.c"; 	while(1 == RF_Reag_SDIO());
	BANKSEL	r0x100A
	CLRR	r0x100A
	BTRSC	_PORTBbits,5
	INCR	r0x100A,F
	MOVR	r0x100A,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	r0x100B,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02107_DS_
	MGOTO	_02089_DS_
_02107_DS_:
	.line	250, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	251, "BSP\bsp_cs1630.c"; 	delay_us(10);
	MOVIA	0x0a
	MCALL	_delay_us
	.line	252, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	253, "BSP\bsp_cs1630.c"; 	IOSTB = C_PB5_Output;
	CLRA	
	IOST	_IOSTB
	.line	255, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _Enter_sleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_read_byte
;   _CS1630_write_byte
;2 compiler assigned registers:
;   r0x100E
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_CE_Low
	.debuginfo subprogram _CS1630_CE_Low
;local variable name mapping:
	.debuginfo complex-type (local-sym "_reg_val" 1 "BSP\bsp_cs1630.c" 224 (basetype 1 unsigned) split "r0x100E")
_CS1630_CE_Low:
; 2 exit points
	.line	225, "BSP\bsp_cs1630.c"; 	reg_val = CS1630_read_byte(CS1630_BANK0_SETUP_VALUE);
	MOVIA	0x1e
	MCALL	_CS1630_read_byte
	BANKSEL	r0x100E
	MOVAR	r0x100E
	.line	226, "BSP\bsp_cs1630.c"; 	reg_val &= ~BIT3;
	BCR	r0x100E,3
	.line	227, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, reg_val);
	MOVR	r0x100E,W
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_CS1630_write_byte
	.line	228, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_CE_Low

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_read_byte
;   _CS1630_write_byte
;2 compiler assigned registers:
;   r0x100F
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_CE_High
	.debuginfo subprogram _CS1630_CE_High
;local variable name mapping:
	.debuginfo complex-type (local-sym "_reg_val" 1 "BSP\bsp_cs1630.c" 214 (basetype 1 unsigned) split "r0x100F")
_CS1630_CE_High:
; 2 exit points
	.line	216, "BSP\bsp_cs1630.c"; 	reg_val = CS1630_read_byte(CS1630_BANK0_SETUP_VALUE);
	MOVIA	0x1e
	MCALL	_CS1630_read_byte
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	217, "BSP\bsp_cs1630.c"; 	reg_val |= BIT3;
	BSR	r0x100F,3
	.line	218, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, reg_val);
	MOVR	r0x100F,W
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_CS1630_write_byte
	.line	219, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_CE_High

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _delay_us
;   _SPI_SendByte
;   _delay_us
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_Flush_Tx
	.debuginfo subprogram _CS1630_Flush_Tx
_CS1630_Flush_Tx:
; 2 exit points
	.line	207, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	208, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_FLUSH_TX);
	MOVIA	0xe1
	MCALL	_SPI_SendByte
	.line	209, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	210, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_Flush_Tx

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_write_byte
;   _CS1630_write_byte
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_Clear_All_Irq
	.debuginfo subprogram _CS1630_Clear_All_Irq
_CS1630_Clear_All_Irq:
; 2 exit points
	.line	201, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_STATUS, 0x70);
	MOVIA	0x70
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_CS1630_write_byte
	.line	202, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_Clear_All_Irq

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_read_byte
;   _CS1630_write_byte
;   _CS1630_read_byte
;   _CS1630_write_byte
;4 compiler assigned registers:
;   r0x1010
;   r0x1011
;   r0x1012
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_ModeSwitch
	.debuginfo subprogram _CS1630_ModeSwitch
;local variable name mapping:
	.debuginfo complex-type (local-sym "_mod" 1 "BSP\bsp_cs1630.c" 176 (basetype 1 unsigned) split "r0x1010")
	.debuginfo complex-type (local-sym "_tmp" 1 "BSP\bsp_cs1630.c" 178 (basetype 1 unsigned) split "r0x1011")
_CS1630_ModeSwitch:
; 2 exit points
	.line	176, "BSP\bsp_cs1630.c"; 	void CS1630_ModeSwitch(RF_ModeTypeDef mod)
	BANKSEL	r0x1010
	MOVAR	r0x1010
	.line	180, "BSP\bsp_cs1630.c"; 	tmp = CS1630_read_byte(CS1630_BANK0_CONFIG);
	MOVIA	0x00
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1011
	MOVAR	r0x1011
	.line	181, "BSP\bsp_cs1630.c"; 	if(mod != Rf_PRX_Mode)
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	BTRSC	STATUS,2
	MGOTO	_02061_DS_
	.line	183, "BSP\bsp_cs1630.c"; 	tmp &= 0xFE;
	MOVIA	0xfe
	BANKSEL	r0x1011
	ANDAR	r0x1011,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MGOTO	_02062_DS_
_02061_DS_:
	.line	187, "BSP\bsp_cs1630.c"; 	tmp |= 0x01;
	MOVIA	0x01
	BANKSEL	r0x1011
	IORAR	r0x1011,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
_02062_DS_:
	.line	189, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, tmp);
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	191, "BSP\bsp_cs1630.c"; 	if(mod == Rf_Carrier_Mode)
	BANKSEL	r0x1010
	MOVR	r0x1010,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02065_DS_
	.line	193, "BSP\bsp_cs1630.c"; 	tmp = 0x80 | CS1630_read_byte(CS1630_BANK0_RF_SETUP);
	MOVIA	0x06
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1010
	MOVAR	r0x1010
	BSR	r0x1010,7
	.line	194, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_RF_SETUP, tmp);
	MOVR	r0x1010,W
	MOVAR	STK00
	MOVIA	0x06
	MCALL	_CS1630_write_byte
_02065_DS_:
	.line	196, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_ModeSwitch

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _CS1630_wr_buffer
;   _CS1630_read_byte
;   _CS1630_wr_buffer
;10 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;   STK01
;   r0x101A
;   STK02
;   r0x101B
;   STK03
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_SendPack
	.debuginfo subprogram _CS1630_SendPack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_cmd" 1 "BSP\bsp_cs1630.c" 165 (basetype 1 unsigned) split "r0x1018")
	.debuginfo complex-type (local-sym "_buf" 3 "BSP\bsp_cs1630.c" 165 (pointer gptr 3 (basetype 1 unsigned)) split "r0x101B" "r0x101A" "r0x1019")
	.debuginfo complex-type (local-sym "_len" 1 "BSP\bsp_cs1630.c" 165 (basetype 1 unsigned) split "r0x101C")
	.debuginfo complex-type (local-sym "_sta" 1 "BSP\bsp_cs1630.c" 167 (basetype 1 unsigned) split "r0x101D")
_CS1630_SendPack:
; 2 exit points
	.line	165, "BSP\bsp_cs1630.c"; 	void CS1630_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len)
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	STK00,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVR	STK01,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	MOVR	STK02,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	MOVR	STK03,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	169, "BSP\bsp_cs1630.c"; 	sta = CS1630_read_byte(CS1630_BANK0_STATUS);
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	170, "BSP\bsp_cs1630.c"; 	if(!(sta&RF_STATUS_TX_FULL))
	BTRSC	r0x101D,0
	MGOTO	_02055_DS_
	.line	172, "BSP\bsp_cs1630.c"; 	CS1630_wr_buffer(cmd, buf, len);
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK03
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK02
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK00
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MCALL	_CS1630_wr_buffer
_02055_DS_:
	.line	174, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_SendPack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_read_byte
;   _CS1630_wr_cmd
;   _CS1630_wr_cmd
;   _CS1630_read_byte
;   _CS1630_wr_cmd
;   _CS1630_wr_cmd
;3 compiler assigned registers:
;   r0x1020
;   r0x1021
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_Bank_Switch
	.debuginfo subprogram _CS1630_Bank_Switch
;local variable name mapping:
	.debuginfo complex-type (local-sym "_bank" 1 "BSP\bsp_cs1630.c" 142 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_sta" 1 "BSP\bsp_cs1630.c" 144 (basetype 1 unsigned) split "r0x1021")
_CS1630_Bank_Switch:
; 2 exit points
	.line	142, "BSP\bsp_cs1630.c"; 	void CS1630_Bank_Switch(unsigned char bank)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	146, "BSP\bsp_cs1630.c"; 	sta = CS1630_read_byte(CS1630_BANK0_STATUS);
	MOVIA	0x07
	MCALL	_CS1630_read_byte
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	148, "BSP\bsp_cs1630.c"; 	if(bank != RF_Bank0) // 切1
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02046_DS_
	.line	152, "BSP\bsp_cs1630.c"; 	CS1630_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
	MOVIA	0x53
	MOVAR	STK00
	MOVIA	0x50
	MCALL	_CS1630_wr_cmd
	MGOTO	_02048_DS_
_02046_DS_:
	.line	157, "BSP\bsp_cs1630.c"; 	if(sta & RF_BANK1) // 切0
	BANKSEL	r0x1021
	BTRSS	r0x1021,7
	MGOTO	_02048_DS_
	.line	159, "BSP\bsp_cs1630.c"; 	CS1630_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
	MOVIA	0x53
	MOVAR	STK00
	MOVIA	0x50
	MCALL	_CS1630_wr_cmd
_02048_DS_:
	.line	162, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_Bank_Switch

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;3 compiler assigned registers:
;   r0x101E
;   STK00
;   r0x101F
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_wr_cmd
	.debuginfo subprogram _CS1630_wr_cmd
;local variable name mapping:
	.debuginfo complex-type (local-sym "_cmd" 1 "BSP\bsp_cs1630.c" 133 (basetype 1 unsigned) split "r0x101E")
	.debuginfo complex-type (local-sym "_D" 1 "BSP\bsp_cs1630.c" 133 (basetype 1 unsigned) split "r0x101F")
_CS1630_wr_cmd:
; 2 exit points
	.line	133, "BSP\bsp_cs1630.c"; 	void CS1630_wr_cmd(unsigned char cmd,unsigned char D)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	MOVR	STK00,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	135, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	136, "BSP\bsp_cs1630.c"; 	SPI_SendByte(cmd);
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	MCALL	_SPI_SendByte
	.line	137, "BSP\bsp_cs1630.c"; 	SPI_SendByte(D);
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	MCALL	_SPI_SendByte
	.line	138, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	139, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_wr_cmd

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   __gptrget1
;   _SPI_SendByte
;   _delay_us
;   _SPI_SendByte
;   __gptrget1
;   _SPI_SendByte
;   _delay_us
;9 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   STK01
;   r0x1015
;   STK02
;   r0x1016
;   STK03
;   r0x1017
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_wr_buffer
	.debuginfo subprogram _CS1630_wr_buffer
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_cs1630.c" 119 (basetype 1 unsigned) split "r0x1013")
_CS1630_wr_buffer:
; 2 exit points
	.line	119, "BSP\bsp_cs1630.c"; 	void CS1630_wr_buffer(unsigned char addr, unsigned char* buf,unsigned char len)
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK00,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	MOVR	STK01,W
	BANKSEL	r0x1015
	MOVAR	r0x1015
	MOVR	STK02,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVR	STK03,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	.line	122, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	123, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_W_REGISTER|addr);
	BANKSEL	r0x1013
	BSR	r0x1013,5
	MOVR	r0x1013,W
	MCALL	_SPI_SendByte
_02029_DS_:
	.line	124, "BSP\bsp_cs1630.c"; 	while(len--)
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BANKSEL	r0x1017
	DECR	r0x1017,F
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	BTRSC	STATUS,2
	MGOTO	_02032_DS_
	.line	126, "BSP\bsp_cs1630.c"; 	SPI_SendByte(*buf++);
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK01
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MOVAR	STK00
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	MCALL	__gptrget1
	BANKSEL	r0x1013
	MOVAR	r0x1013
	BANKSEL	r0x1016
	INCR	r0x1016,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x1015
	INCR	r0x1015,F
_00001_DS_:
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x1014
	INCR	r0x1014,F
_00002_DS_:
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MCALL	_SPI_SendByte
	MGOTO	_02029_DS_
_02032_DS_:
	.line	128, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	130, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_wr_buffer

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;   _SPI_SendByte
;   _SPI_SendByte
;   _delay_us
;3 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_write_byte
	.debuginfo subprogram _CS1630_write_byte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_cs1630.c" 109 (basetype 1 unsigned) split "r0x100C")
	.debuginfo complex-type (local-sym "_D" 1 "BSP\bsp_cs1630.c" 109 (basetype 1 unsigned) split "r0x100D")
_CS1630_write_byte:
; 2 exit points
	.line	109, "BSP\bsp_cs1630.c"; 	void CS1630_write_byte(unsigned char addr,unsigned char D)
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK00,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	.line	112, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	113, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_W_REGISTER|addr);
	BANKSEL	r0x100C
	BSR	r0x100C,5
	MOVR	r0x100C,W
	MCALL	_SPI_SendByte
	.line	114, "BSP\bsp_cs1630.c"; 	SPI_SendByte(D);
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	MCALL	_SPI_SendByte
	.line	115, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	117, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_write_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _SPI_ReadByte
;   _delay_us
;   _SPI_SendByte
;   _SPI_ReadByte
;   _delay_us
;1 compiler assigned register :
;   r0x1009
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_read_byte
	.debuginfo subprogram _CS1630_read_byte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_cs1630.c" 96 (basetype 1 unsigned) split "r0x1009")
	.debuginfo complex-type (local-sym "_rxdata" 1 "BSP\bsp_cs1630.c" 98 (basetype 1 unsigned) split "r0x1009")
_CS1630_read_byte:
; 2 exit points
	.line	96, "BSP\bsp_cs1630.c"; 	unsigned char CS1630_read_byte(unsigned char addr)
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	100, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	101, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_R_REGISTER|addr);
	MOVR	r0x1009,W
	MCALL	_SPI_SendByte
	.line	102, "BSP\bsp_cs1630.c"; 	rxdata = SPI_ReadByte();
	MCALL	_SPI_ReadByte
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	103, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	105, "BSP\bsp_cs1630.c"; 	return(rxdata);
	BANKSEL	r0x1009
	MOVR	r0x1009,W
	.line	106, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_read_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SPI_SendByte
;   _SPI_ReadByte
;   __gptrput1
;   _delay_us
;   _delay_us
;   _SPI_SendByte
;   _SPI_ReadByte
;   __gptrput1
;   _delay_us
;   _delay_us
;9 compiler assigned registers:
;   r0x1022
;   STK00
;   r0x1023
;   STK01
;   r0x1024
;   STK02
;   r0x1025
;   STK03
;   r0x1026
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_read_buffer
	.debuginfo subprogram _CS1630_read_buffer
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_cs1630.c" 80 (basetype 1 unsigned) split "r0x1022")
_CS1630_read_buffer:
; 2 exit points
	.line	80, "BSP\bsp_cs1630.c"; 	void CS1630_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len)
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	STK00,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK01,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK02,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK03,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	83, "BSP\bsp_cs1630.c"; 	CS1630_CSN_LOW;
	BCR	_PORTAbits,1
	.line	84, "BSP\bsp_cs1630.c"; 	SPI_SendByte(RF_R_REGISTER|addr);
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MCALL	_SPI_SendByte
_02014_DS_:
	.line	86, "BSP\bsp_cs1630.c"; 	while(len--)
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	BANKSEL	r0x1026
	DECR	r0x1026,F
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_02016_DS_
	.line	88, "BSP\bsp_cs1630.c"; 	*buf++ = SPI_ReadByte();
	MCALL	_SPI_ReadByte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK02
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK00
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MCALL	__gptrput1
	BANKSEL	r0x1025
	INCR	r0x1025,F
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	r0x1024
	INCR	r0x1024,F
_00003_DS_:
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	r0x1023
	INCR	r0x1023,F
_00004_DS_:
	MGOTO	_02014_DS_
_02016_DS_:
	.line	91, "BSP\bsp_cs1630.c"; 	delay_us(1);
	MOVIA	0x01
	MCALL	_delay_us
	.line	92, "BSP\bsp_cs1630.c"; 	CS1630_CSN_HIGH;
	BSR	_PORTAbits,1
	MOVIA	0x01
	MCALL	_delay_us
	.line	93, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_read_buffer

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_softSPI_Init
;   _CS1630_CE_Low
;   _CS1630_write_byte
;   _delay_ms
;   _CS1630_Soft_Rst
;   _CS1630_CE_High
;   _delay_us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_Bank_Switch
;   _CS1630_read_byte
;   _CS1630_read_buffer
;   _CS1630_wr_buffer
;   _CS1630_write_byte
;   _CS1630_Bank_Switch
;   _CS1630_write_byte
;   _get_rolling_code_0
;   _get_rolling_code_1
;   _get_rolling_code_2
;   _get_rolling_code_3
;   _CS1630_wr_buffer
;   _CS1630_Clear_All_Irq
;   _CS1630_Flush_Tx
;   _RF_softSPI_Init
;   _CS1630_CE_Low
;   _CS1630_write_byte
;   _delay_ms
;   _CS1630_Soft_Rst
;   _CS1630_CE_High
;   _delay_us
;   _CS1630_CE_Low
;   _CS1630_read_byte
;   _CS1630_Bank_Switch
;   _CS1630_read_byte
;   _CS1630_read_buffer
;   _CS1630_wr_buffer
;   _CS1630_write_byte
;   _CS1630_Bank_Switch
;   _CS1630_write_byte
;   _get_rolling_code_0
;   _get_rolling_code_1
;   _get_rolling_code_2
;   _get_rolling_code_3
;   _CS1630_wr_buffer
;   _CS1630_Clear_All_Irq
;   _CS1630_Flush_Tx
;8 compiler assigned registers:
;   STK00
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_Init
	.debuginfo subprogram _CS1630_Init
;local variable name mapping:
	.debuginfo complex-type (local-sym "_regval" 1 "BSP\bsp_cs1630.c" 25 (basetype 1 unsigned) split "r0x102A")
	.debuginfo complex-type (local-sym "_temp" 5 "BSP\bsp_cs1630.c" 24 (array 5 (basetype 1 unsigned)) link "_CS1630_Init_temp_65536_63")
_CS1630_Init:
; 2 exit points
	.line	27, "BSP\bsp_cs1630.c"; 	RF_softSPI_Init();
	MCALL	_RF_softSPI_Init
	.line	31, "BSP\bsp_cs1630.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
	.line	32, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_CONFIG, 0x02); // 先断一下电，然后再等待一下在开始等待校准
	MOVIA	0x02
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_CS1630_write_byte
	.line	33, "BSP\bsp_cs1630.c"; 	delay_ms(4);
	MOVIA	0x04
	MCALL	_delay_ms
	.line	35, "BSP\bsp_cs1630.c"; 	CS1630_Soft_Rst();
	MCALL	_CS1630_Soft_Rst
	.line	37, "BSP\bsp_cs1630.c"; 	CS1630_CE_High();
	MCALL	_CS1630_CE_High
	.line	38, "BSP\bsp_cs1630.c"; 	delay_us(16);
	MOVIA	0x10
	MCALL	_delay_us
	.line	39, "BSP\bsp_cs1630.c"; 	CS1630_CE_Low();
	MCALL	_CS1630_CE_Low
_02009_DS_:
	.line	41, "BSP\bsp_cs1630.c"; 	while((CS1630_read_byte(CS1630_BANK0_SETUP_VALUE) & 0x01) == 0x00); // 等待校准结束
	MOVIA	0x1e
	MCALL	_CS1630_read_byte
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BTRSS	r0x102A,0
	MGOTO	_02009_DS_
	.line	44, "BSP\bsp_cs1630.c"; 	CS1630_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_CS1630_Bank_Switch
	.line	46, "BSP\bsp_cs1630.c"; 	regval = CS1630_read_byte(CS1630_BANK1_DAC_RANGE); // 记录校准值
	MOVIA	0x11
	MCALL	_CS1630_read_byte
	BANKSEL	r0x102A
	MOVAR	r0x102A
	.line	47, "BSP\bsp_cs1630.c"; 	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, temp, 4);
	MOVIA	(_CS1630_Init_temp_65536_63 + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_CS1630_read_buffer
	.line	48, "BSP\bsp_cs1630.c"; 	temp[0] = 0x07;
	MOVIA	0x07
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 0)
	.line	49, "BSP\bsp_cs1630.c"; 	temp[1] = 0x80;
	MOVIA	0x80
	MOVAR	(_CS1630_Init_temp_65536_63 + 1)
	.line	50, "BSP\bsp_cs1630.c"; 	temp[2] |= (BIT6+BIT3);
	MOVR	(_CS1630_Init_temp_65536_63 + 2),W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVIA	0x48
	IORAR	r0x102B,F
	MOVR	r0x102B,W
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 2)
	.line	51, "BSP\bsp_cs1630.c"; 	CS1630_wr_buffer(CS1630_BANK1_PLL_CTL0, temp, 4); // 配置Bank1 的 PLL_CTL0为07  80  48
	MOVIA	(_CS1630_Init_temp_65536_63 + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	BANKSEL	r0x102D
	CLRR	r0x102D
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK02
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK01
	BANKSEL	r0x102D
	MOVR	r0x102D,W
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_CS1630_wr_buffer
	.line	53, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK1_DAC_RANGE, regval); // 恢复校准值，后续休眠唤醒后不用再次校准
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK00
	MOVIA	0x11
	MCALL	_CS1630_write_byte
	.line	54, "BSP\bsp_cs1630.c"; 	CS1630_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_CS1630_Bank_Switch
	.line	56, "BSP\bsp_cs1630.c"; 	CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x01);
	MOVIA	0x01
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_CS1630_write_byte
	.line	61, "BSP\bsp_cs1630.c"; 	temp[0] = 0x34;
	MOVIA	0x34
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 0)
	.line	62, "BSP\bsp_cs1630.c"; 	temp[1] = get_rolling_code_0()+1;
	MCALL	_get_rolling_code_0
	BANKSEL	r0x102A
	MOVAR	r0x102A
	INCR	r0x102A,F
	MOVR	r0x102A,W
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 1)
	.line	63, "BSP\bsp_cs1630.c"; 	temp[2] = get_rolling_code_1()+1;
	MCALL	_get_rolling_code_1
	BANKSEL	r0x102A
	MOVAR	r0x102A
	INCR	r0x102A,F
	MOVR	r0x102A,W
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 2)
	.line	64, "BSP\bsp_cs1630.c"; 	temp[3] = get_rolling_code_2()+1;
	MCALL	_get_rolling_code_2
	BANKSEL	r0x102A
	MOVAR	r0x102A
	INCR	r0x102A,F
	MOVR	r0x102A,W
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 3)
	.line	65, "BSP\bsp_cs1630.c"; 	temp[4] = get_rolling_code_3()+1;
	MCALL	_get_rolling_code_3
	BANKSEL	r0x102A
	MOVAR	r0x102A
	INCR	r0x102A,F
	MOVR	r0x102A,W
	BANKSEL	_CS1630_Init_temp_65536_63
	MOVAR	(_CS1630_Init_temp_65536_63 + 4)
	.line	67, "BSP\bsp_cs1630.c"; 	CS1630_wr_buffer(CS1630_BANK0_TX_ADDR, temp, 5); // set address
	MOVIA	(_CS1630_Init_temp_65536_63 + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BANKSEL	r0x102B
	CLRR	r0x102B
	BANKSEL	r0x102C
	CLRR	r0x102C
	MOVIA	0x05
	MOVAR	STK03
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK02
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK01
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_CS1630_wr_buffer
	.line	74, "BSP\bsp_cs1630.c"; 	CS1630_Clear_All_Irq();
	MCALL	_CS1630_Clear_All_Irq
	.line	75, "BSP\bsp_cs1630.c"; 	CS1630_Flush_Tx();
	MCALL	_CS1630_Flush_Tx
	.line	76, "BSP\bsp_cs1630.c"; 	CLRWDT();
	clrwdt
	.line	78, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _CS1630_Bank_Switch
;   _CS1630_read_buffer
;   _CS1630_wr_buffer
;   _CS1630_read_buffer
;   _CS1630_Bank_Switch
;   _CS1630_Bank_Switch
;   _CS1630_read_buffer
;   _CS1630_wr_buffer
;   _CS1630_read_buffer
;   _CS1630_Bank_Switch
;7 compiler assigned registers:
;   r0x1027
;   r0x1028
;   r0x1029
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_cs1630, function=_CS1630_Soft_Rst
	.debuginfo subprogram _CS1630_Soft_Rst
;local variable name mapping:
	.debuginfo complex-type (local-sym "_soft_temp" 4 "BSP\bsp_cs1630.c" 11 (array 4 (basetype 1 unsigned)) link "_CS1630_Soft_Rst_soft_temp_65536_61")
_CS1630_Soft_Rst:
; 2 exit points
	.line	12, "BSP\bsp_cs1630.c"; 	CS1630_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_CS1630_Bank_Switch
	.line	14, "BSP\bsp_cs1630.c"; 	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4); // 读取该寄存器状态
	MOVIA	(_CS1630_Soft_Rst_soft_temp_65536_61 + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK02
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_CS1630_read_buffer
	.line	15, "BSP\bsp_cs1630.c"; 	soft_temp[3] |= 0x80; // 将最低位置0
	BANKSEL	_CS1630_Soft_Rst_soft_temp_65536_61
	MOVR	(_CS1630_Soft_Rst_soft_temp_65536_61 + 3),W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BSR	r0x1027,7
	MOVR	r0x1027,W
	BANKSEL	_CS1630_Soft_Rst_soft_temp_65536_61
	MOVAR	(_CS1630_Soft_Rst_soft_temp_65536_61 + 3)
	.line	16, "BSP\bsp_cs1630.c"; 	CS1630_wr_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4);
	MOVIA	(_CS1630_Soft_Rst_soft_temp_65536_61 + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK02
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_CS1630_wr_buffer
	.line	17, "BSP\bsp_cs1630.c"; 	CS1630_read_buffer(CS1630_BANK1_PLL_CTL0, soft_temp, 4);
	MOVIA	(_CS1630_Soft_Rst_soft_temp_65536_61 + 0)
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1028
	CLRR	r0x1028
	BANKSEL	r0x1029
	CLRR	r0x1029
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK02
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x01
	MCALL	_CS1630_read_buffer
	.line	18, "BSP\bsp_cs1630.c"; 	CS1630_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_CS1630_Bank_Switch
	.line	19, "BSP\bsp_cs1630.c"; 	}
	RETURN	
; exit point of _CS1630_Soft_Rst


;	code size estimation:
;	  420+  131 =   551 instructions ( 1364 byte)

	end
