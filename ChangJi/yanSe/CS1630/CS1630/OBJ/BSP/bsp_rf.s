;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"BSP\bsp_rf.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__muluchar
	extern	_SPI_ReadByte
	extern	_SPI_SendByte
	extern	_RF_softSPI_Init
	extern	_delay_40us
	extern	_delay_us
	extern	_delay_250ms
	extern	_delay_ms
	extern	_clear_ram
	extern	_multi_16b
	extern	_RF_Init
	extern	_RF_spi_wrd
	extern	_RF_CE_Low
	extern	_RF_CE_High_Pulse
	extern	_RF_CE_High
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
	extern	__gptrput1

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
	extern	_RF_ChangeCC
	extern	_RF_Tx_Power
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
	extern	_RF_Bank_Switch
	extern	_RF_ChangeAddr_Reg
	extern	_RF_Change_CH
	extern	_RF_Change_Pwr
	extern	_RF_Clear_All_Irq
	extern	_RF_Configure_Reg
	extern	_RF_Flush_Rx
	extern	_RF_Flush_Tx
	extern	_RF_Get_Chip_ID
	extern	_RF_Get_RSSI
	extern	_RF_ModeSwitch
	extern	_RF_Operation
	extern	_RF_read_buffer
	extern	_RF_read_byte
	extern	_RF_Read_Status
	extern	_RF_ReceivePack
	extern	_RF_SendPack
	extern	_RF_Soft_Rst
	extern	_RF_Write_Ack_Payload
	extern	_RF_wr_buffer
	extern	_RF_write_byte
	extern	_RF_wr_cmd

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
r0x1007:
	.res	1
.segment "uninit"
r0x1008:
	.res	1
.segment "uninit"
r0x1046:
	.res	1
.segment "uninit"
r0x1045:
	.res	1
.segment "uninit"
r0x1044:
	.res	1
.segment "uninit"
r0x1047:
	.res	1
.segment "uninit"
r0x1043:
	.res	1
.segment "uninit"
r0x103C:
	.res	1
.segment "uninit"
r0x103D:
	.res	1
.segment "uninit"
r0x103E:
	.res	1
.segment "uninit"
r0x103F:
	.res	1
.segment "uninit"
r0x1041:
	.res	1
.segment "uninit"
r0x1040:
	.res	1
.segment "uninit"
r0x1042:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x1036:
	.res	1
.segment "uninit"
r0x1037:
	.res	1
.segment "uninit"
r0x1038:
	.res	1
.segment "uninit"
r0x1039:
	.res	1
.segment "uninit"
r0x103A:
	.res	1
.segment "uninit"
r0x103B:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x1030:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x1016:
	.res	1
.segment "uninit"
r0x1019:
	.res	1
.segment "uninit"
r0x1018:
	.res	1
.segment "uninit"
r0x1017:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1005:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
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
r0x1020:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x101B:
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
r0x1013:
	.res	1
.segment "uninit"
r0x1012:
	.res	1
.segment "uninit"
r0x1011:
	.res	1
.segment "uninit"
r0x1014:
	.res	1
.segment "uninit"
r0x1015:
	.res	1
.segment "uninit"
r0x100B:
	.res	1
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
r0x100C:
	.res	1
.segment "uninit"
r0x100F:
	.res	1
.segment "uninit"
r0x1006:
	.res	1
.segment "uninit"
r0x1009:
	.res	1
.segment "uninit"
r0x100A:
	.res	1
.segment "uninit"
_RF_Get_Chip_ID_ReadArr_65536_61:
	.res	1
	.debuginfo complex-type (symbol "_RF_Get_Chip_ID_ReadArr_65536_61" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_RF_Soft_Rst_soft_temp_65536_89:
	.res	4
	.debuginfo complex-type (symbol "_RF_Soft_Rst_soft_temp_65536_89" 4 global "" 0 (basetype 4 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "code"
_RF_Tx_Power:
	retia 0x00	; 0
	retia 0x9f	; 159
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x00	; 0
	retia 0x1f	; 31
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x9f	; 159
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x1f	; 31
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x03	; 3
	retia 0x1f	; 31
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x07	; 7
	retia 0x9f	; 159
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x40	; 64
	retia 0x1f	; 31
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
	retia 0x47	; 71	'G'
	retia 0x1f	; 31
	retia 0x64	; 100	'd'
	retia 0x00	; 0
	retia 0x01	; 1
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
; code_bsp_rf	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Bank_Switch
;   _RF_read_byte
;   _RF_write_byte
;   _RF_Bank_Switch
;   _RF_Bank_Switch
;   _RF_read_byte
;   _RF_write_byte
;   _RF_Bank_Switch
;3 compiler assigned registers:
;   r0x1009
;   r0x100A
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_ChangeCC
	.debuginfo subprogram _RF_ChangeCC
;local variable name mapping:
	.debuginfo complex-type (local-sym "_cc" 1 "BSP\bsp_rf.c" 407 (basetype 1 unsigned) split "r0x1009")
	.debuginfo complex-type (local-sym "_reg_val" 1 "BSP\bsp_rf.c" 409 (basetype 1 unsigned) split "r0x100A")
_RF_ChangeCC:
; 2 exit points
	.line	407, "BSP\bsp_rf.c"; 	void RF_ChangeCC(unsigned char cc)
	BANKSEL	r0x1009
	MOVAR	r0x1009
	.line	410, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_RF_Bank_Switch
	.line	411, "BSP\bsp_rf.c"; 	reg_val = RF_read_byte(RF_BANK1_RF_IVGEN);
	MOVIA	0x1e
	MCALL	_RF_read_byte
	BANKSEL	r0x100A
	MOVAR	r0x100A
	.line	412, "BSP\bsp_rf.c"; 	reg_val &= ~0x1f;
	MOVIA	0xe0
	ANDAR	r0x100A,F
	.line	413, "BSP\bsp_rf.c"; 	reg_val |= (cc & 0x1f);
	MOVIA	0x1f
	BANKSEL	r0x1009
	ANDAR	r0x1009,F
	MOVR	r0x1009,W
	BANKSEL	r0x100A
	IORAR	r0x100A,F
	.line	414, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK1_RF_IVGEN, reg_val);
	MOVR	r0x100A,W
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_RF_write_byte
	.line	415, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_RF_Bank_Switch
	.line	416, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_ChangeCC

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;3 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_wr_cmd
	.debuginfo subprogram _RF_wr_cmd
;local variable name mapping:
	.debuginfo complex-type (local-sym "_cmd" 1 "BSP\bsp_rf.c" 388 (basetype 1 unsigned) split "r0x1005")
	.debuginfo complex-type (local-sym "_D" 1 "BSP\bsp_rf.c" 388 (basetype 1 unsigned) split "r0x1006")
_RF_wr_cmd:
; 2 exit points
	.line	388, "BSP\bsp_rf.c"; 	void RF_wr_cmd(unsigned char cmd, unsigned char D)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK00,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	.line	391, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	394, "BSP\bsp_rf.c"; 	RF_spi_wrd(cmd);
	BANKSEL	r0x1005
	MOVR	r0x1005,W
	MCALL	_RF_spi_wrd
	.line	397, "BSP\bsp_rf.c"; 	if (D!= 0)
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	BTRSC	STATUS,2
	MGOTO	_02215_DS_
	.line	399, "BSP\bsp_rf.c"; 	RF_spi_wrd(D);
	MOVR	r0x1006,W
	MCALL	_RF_spi_wrd
_02215_DS_:
	.line	403, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	404, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_wr_cmd

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;3 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_write_byte
	.debuginfo subprogram _RF_write_byte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_rf.c" 373 (basetype 1 unsigned) split "r0x1005")
	.debuginfo complex-type (local-sym "_D" 1 "BSP\bsp_rf.c" 373 (basetype 1 unsigned) split "r0x1006")
_RF_write_byte:
; 2 exit points
	.line	373, "BSP\bsp_rf.c"; 	void RF_write_byte(unsigned char addr,unsigned char D)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	MOVR	STK00,W
	BANKSEL	r0x1006
	MOVAR	r0x1006
	.line	375, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	376, "BSP\bsp_rf.c"; 	RF_spi_wrd(RF_W_REGISTER|addr);
	BANKSEL	r0x1005
	BSR	r0x1005,5
	MOVR	r0x1005,W
	MCALL	_RF_spi_wrd
	.line	377, "BSP\bsp_rf.c"; 	RF_spi_wrd(D);
	BANKSEL	r0x1006
	MOVR	r0x1006,W
	MCALL	_RF_spi_wrd
	.line	378, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	379, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_write_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   __gptrget1
;   _RF_spi_wrd
;   _RF_spi_wrd
;   __gptrget1
;   _RF_spi_wrd
;9 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   STK01
;   r0x100D
;   STK02
;   r0x100E
;   STK03
;   r0x100F
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_wr_buffer
	.debuginfo subprogram _RF_wr_buffer
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_rf.c" 361 (basetype 1 unsigned) split "r0x100B")
_RF_wr_buffer:
; 2 exit points
	.line	361, "BSP\bsp_rf.c"; 	void RF_wr_buffer(unsigned char addr,const unsigned char* buf,unsigned char len)
	BANKSEL	r0x100B
	MOVAR	r0x100B
	MOVR	STK00,W
	BANKSEL	r0x100C
	MOVAR	r0x100C
	MOVR	STK01,W
	BANKSEL	r0x100D
	MOVAR	r0x100D
	MOVR	STK02,W
	BANKSEL	r0x100E
	MOVAR	r0x100E
	MOVR	STK03,W
	BANKSEL	r0x100F
	MOVAR	r0x100F
	.line	363, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	364, "BSP\bsp_rf.c"; 	RF_spi_wrd(RF_W_REGISTER|addr);
	BANKSEL	r0x100B
	BSR	r0x100B,5
	MOVR	r0x100B,W
	MCALL	_RF_spi_wrd
_02203_DS_:
	.line	365, "BSP\bsp_rf.c"; 	while(len--)
	BANKSEL	r0x100F
	MOVR	r0x100F,W
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100F
	DECR	r0x100F,F
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	BTRSC	STATUS,2
	MGOTO	_02205_DS_
	.line	367, "BSP\bsp_rf.c"; 	RF_spi_wrd(*buf++);
	BANKSEL	r0x100E
	MOVR	r0x100E,W
	MOVAR	STK01
	BANKSEL	r0x100D
	MOVR	r0x100D,W
	MOVAR	STK00
	BANKSEL	r0x100C
	MOVR	r0x100C,W
	MCALL	__gptrget1
	BANKSEL	r0x100B
	MOVAR	r0x100B
	BANKSEL	r0x100E
	INCR	r0x100E,F
	BTRSS	STATUS,2
	MGOTO	_00001_DS_
	BANKSEL	r0x100D
	INCR	r0x100D,F
_00001_DS_:
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	BANKSEL	r0x100C
	INCR	r0x100C,F
_00002_DS_:
	BANKSEL	r0x100B
	MOVR	r0x100B,W
	MCALL	_RF_spi_wrd
	MGOTO	_02203_DS_
_02205_DS_:
	.line	369, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	370, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_wr_buffer

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   __gptrget1
;   _RF_spi_wrd
;   _RF_spi_wrd
;   __gptrget1
;   _RF_spi_wrd
;10 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   STK01
;   r0x1012
;   STK02
;   r0x1013
;   STK03
;   r0x1014
;   r0x1015
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Write_Ack_Payload
	.debuginfo subprogram _RF_Write_Ack_Payload
;local variable name mapping:
	.debuginfo complex-type (local-sym "_PipeNum" 1 "BSP\bsp_rf.c" 348 (basetype 1 unsigned) split "r0x1010")
	.debuginfo complex-type (local-sym "_bytes" 1 "BSP\bsp_rf.c" 348 (basetype 1 unsigned) split "r0x1014")
	.debuginfo complex-type (local-sym "_byte_ctr" 1 "BSP\bsp_rf.c" 350 (basetype 1 unsigned) split "r0x1010")
_RF_Write_Ack_Payload:
; 2 exit points
	.line	348, "BSP\bsp_rf.c"; 	void RF_Write_Ack_Payload(unsigned char PipeNum, unsigned char *pBuf, unsigned char bytes)
	BANKSEL	r0x1010
	MOVAR	r0x1010
	MOVR	STK00,W
	BANKSEL	r0x1011
	MOVAR	r0x1011
	MOVR	STK01,W
	BANKSEL	r0x1012
	MOVAR	r0x1012
	MOVR	STK02,W
	BANKSEL	r0x1013
	MOVAR	r0x1013
	MOVR	STK03,W
	BANKSEL	r0x1014
	MOVAR	r0x1014
	.line	352, "BSP\bsp_rf.c"; 	RF_CSN_LOW;   //����
	BCR	_PORTAbits,1
	.line	353, "BSP\bsp_rf.c"; 	RF_spi_wrd(RF_W_ACK_PAYLOAD | PipeNum);
	MOVIA	0xa8
	BANKSEL	r0x1010
	IORAR	r0x1010,F
	MOVR	r0x1010,W
	MCALL	_RF_spi_wrd
	.line	354, "BSP\bsp_rf.c"; 	for(byte_ctr = 0; byte_ctr < bytes; byte_ctr++)	   // then write all byte in buffer(*pBuf)
	BANKSEL	r0x1010
	CLRR	r0x1010
_02198_DS_:
	BANKSEL	r0x1014
	MOVR	r0x1014,W
	BANKSEL	r0x1010
	SUBAR	r0x1010,W
	BTRSC	STATUS,0
	MGOTO	_02196_DS_
	.line	356, "BSP\bsp_rf.c"; 	RF_spi_wrd(*pBuf++);
	BANKSEL	r0x1013
	MOVR	r0x1013,W
	MOVAR	STK01
	BANKSEL	r0x1012
	MOVR	r0x1012,W
	MOVAR	STK00
	BANKSEL	r0x1011
	MOVR	r0x1011,W
	MCALL	__gptrget1
	BANKSEL	r0x1015
	MOVAR	r0x1015
	BANKSEL	r0x1013
	INCR	r0x1013,F
	BTRSS	STATUS,2
	MGOTO	_00003_DS_
	BANKSEL	r0x1012
	INCR	r0x1012,F
_00003_DS_:
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	BANKSEL	r0x1011
	INCR	r0x1011,F
_00004_DS_:
	BANKSEL	r0x1015
	MOVR	r0x1015,W
	MCALL	_RF_spi_wrd
	.line	354, "BSP\bsp_rf.c"; 	for(byte_ctr = 0; byte_ctr < bytes; byte_ctr++)	   // then write all byte in buffer(*pBuf)
	BANKSEL	r0x1010
	INCR	r0x1010,F
	MGOTO	_02198_DS_
_02196_DS_:
	.line	358, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	359, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Write_Ack_Payload

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Bank_Switch
;   _RF_read_buffer
;   _RF_wr_buffer
;   _RF_Bank_Switch
;   _RF_read_buffer
;   _RF_wr_buffer
;7 compiler assigned registers:
;   r0x101B
;   r0x101C
;   r0x101D
;   STK03
;   STK02
;   STK01
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Soft_Rst
	.debuginfo subprogram _RF_Soft_Rst
;local variable name mapping:
	.debuginfo complex-type (local-sym "_soft_temp" 4 "BSP\bsp_rf.c" 339 (array 4 (basetype 1 unsigned)) link "_RF_Soft_Rst_soft_temp_65536_89")
_RF_Soft_Rst:
; 2 exit points
	.line	340, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_RF_Bank_Switch
	.line	342, "BSP\bsp_rf.c"; 	RF_read_buffer(RF_BANK1_PLL_CTL1, soft_temp, 4);
	MOVIA	(_RF_Soft_Rst_soft_temp_65536_89 + 0)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	CLRR	r0x101C
	BANKSEL	r0x101D
	CLRR	r0x101D
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK02
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK01
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_RF_read_buffer
	.line	343, "BSP\bsp_rf.c"; 	soft_temp[3] |= 0x80;
	BANKSEL	_RF_Soft_Rst_soft_temp_65536_89
	MOVR	(_RF_Soft_Rst_soft_temp_65536_89 + 3),W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,7
	MOVR	r0x101B,W
	BANKSEL	_RF_Soft_Rst_soft_temp_65536_89
	MOVAR	(_RF_Soft_Rst_soft_temp_65536_89 + 3)
	.line	344, "BSP\bsp_rf.c"; 	RF_wr_buffer(RF_BANK1_PLL_CTL1, soft_temp, 4);
	MOVIA	(_RF_Soft_Rst_soft_temp_65536_89 + 0)
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	CLRR	r0x101C
	BANKSEL	r0x101D
	CLRR	r0x101D
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK02
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK01
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK00
	MOVIA	0x02
	MCALL	_RF_wr_buffer
	.line	345, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Soft_Rst

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Read_Status
;   _RF_wr_buffer
;   _RF_Read_Status
;   _RF_wr_buffer
;10 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK01
;   r0x1022
;   STK02
;   r0x1023
;   STK03
;   r0x1024
;   r0x1025
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_SendPack
	.debuginfo subprogram _RF_SendPack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_cmd" 1 "BSP\bsp_rf.c" 326 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_buf" 3 "BSP\bsp_rf.c" 326 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1023" "r0x1022" "r0x1021")
	.debuginfo complex-type (local-sym "_len" 1 "BSP\bsp_rf.c" 326 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_sta" 1 "BSP\bsp_rf.c" 328 (basetype 1 unsigned) split "r0x1025")
_RF_SendPack:
; 2 exit points
	.line	326, "BSP\bsp_rf.c"; 	void RF_SendPack(unsigned char cmd, unsigned char* buf, unsigned char len)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK01,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	STK02,W
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK03,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	330, "BSP\bsp_rf.c"; 	sta = RF_Read_Status();
	MCALL	_RF_Read_Status
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	331, "BSP\bsp_rf.c"; 	if(!(sta&RF_STATUS_TX_FULL))
	BTRSC	r0x1025,0
	MGOTO	_02187_DS_
	.line	333, "BSP\bsp_rf.c"; 	RF_wr_buffer(cmd, buf, len);
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK03
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	MOVAR	STK02
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MOVAR	STK01
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MOVAR	STK00
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_RF_wr_buffer
_02187_DS_:
	.line	335, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_SendPack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Read_Status
;   _RF_read_byte
;   _RF_read_buffer
;   _RF_Flush_Rx
;   _RF_read_byte
;   _RF_write_byte
;   _RF_write_byte
;   _RF_Read_Status
;   _RF_read_byte
;   _RF_read_buffer
;   _RF_Flush_Rx
;   _RF_read_byte
;   _RF_write_byte
;   _RF_write_byte
;10 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   STK01
;   r0x1028
;   r0x1029
;   r0x102A
;   STK03
;   STK02
;   r0x102B
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_ReceivePack
	.debuginfo subprogram _RF_ReceivePack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_buf" 3 "BSP\bsp_rf.c" 285 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1028" "r0x1027" "r0x1026")
	.debuginfo complex-type (local-sym "_sta" 1 "BSP\bsp_rf.c" 287 (basetype 1 unsigned) split "r0x1029")
	.debuginfo complex-type (local-sym "_len" 1 "BSP\bsp_rf.c" 289 (basetype 1 unsigned) split "r0x102A")
	.debuginfo complex-type (local-sym "_fifo_sta" 1 "BSP\bsp_rf.c" 288 (basetype 1 unsigned) split "r0x102B")
_RF_ReceivePack:
; 2 exit points
	.line	285, "BSP\bsp_rf.c"; 	unsigned char RF_ReceivePack(unsigned char* buf)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK00,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK01,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	291, "BSP\bsp_rf.c"; 	sta = RF_Read_Status();
	MCALL	_RF_Read_Status
	BANKSEL	r0x1029
	MOVAR	r0x1029
	.line	293, "BSP\bsp_rf.c"; 	if(RF_STATUS_RX_DR & sta)
	BTRSS	r0x1029,6
	MGOTO	_02159_DS_
_02155_DS_:
	.line	297, "BSP\bsp_rf.c"; 	len = RF_read_byte(RF_R_RX_PL_WID);
	MOVIA	0x60
	MCALL	_RF_read_byte
	BANKSEL	r0x102A
	MOVAR	r0x102A
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x21=33), size=1
	.line	299, "BSP\bsp_rf.c"; 	if(len <= RF_FIFO_MAX_PACK_SIZE)
	MOVIA	0x21
	SUBAR	r0x102A,W
	BTRSC	STATUS,0
	MGOTO	_02153_DS_
	.line	301, "BSP\bsp_rf.c"; 	RF_read_buffer(RF_R_RX_PAYLOAD, buf, len);
	MOVR	r0x102A,W
	MOVAR	STK03
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK02
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	MOVIA	0x61
	MCALL	_RF_read_buffer
	MGOTO	_02154_DS_
_02153_DS_:
	.line	305, "BSP\bsp_rf.c"; 	RF_Flush_Rx();
	MCALL	_RF_Flush_Rx
_02154_DS_:
	.line	308, "BSP\bsp_rf.c"; 	fifo_sta = RF_read_byte(RF_BANK0_FIFO_STATUS);
	MOVIA	0x17
	MCALL	_RF_read_byte
	BANKSEL	r0x102B
	MOVAR	r0x102B
	.line	311, "BSP\bsp_rf.c"; 	}while(!(fifo_sta & RF_FIFO_STA_RX_EMPTY));/*not empty continue read out*/
	BTRSS	r0x102B,0
	MGOTO	_02155_DS_
	.line	313, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_STATUS, sta);/*clear irq*/
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_RF_write_byte
	.line	314, "BSP\bsp_rf.c"; 	return len;
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MGOTO	_02162_DS_
_02159_DS_:
	.line	317, "BSP\bsp_rf.c"; 	if(sta & (RF_STATUS_RX_DR | RF_STATUS_TX_DS | RF_STATUS_MAX_RT))
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	ANDIA	0x70
	BTRSS	STATUS,2
	MGOTO	_02180_DS_
	MGOTO	_02161_DS_
_02180_DS_:
	.line	319, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_STATUS, sta);/*clear irq*/
	BANKSEL	r0x1029
	MOVR	r0x1029,W
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_RF_write_byte
_02161_DS_:
	.line	322, "BSP\bsp_rf.c"; 	return 0;
	MOVIA	0x00
_02162_DS_:
	.line	323, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_ReceivePack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Operation
;   _RF_Operation
;1 compiler assigned register :
;   r0x101F
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Read_Status
	.debuginfo subprogram _RF_Read_Status
;local variable name mapping:
	.debuginfo complex-type (local-sym "_status" 1 "BSP\bsp_rf.c" 278 (basetype 1 unsigned) split "r0x101F")
_RF_Read_Status:
; 2 exit points
	.line	279, "BSP\bsp_rf.c"; 	status = RF_Operation(RF_READ_STATUS);
	MOVIA	0xff
	MCALL	_RF_Operation
	BANKSEL	r0x101F
	MOVAR	r0x101F
	.line	281, "BSP\bsp_rf.c"; 	return status;
	MOVR	r0x101F,W
	.line	282, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Read_Status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;   _RF_spi_wrd
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_read_byte
	.debuginfo subprogram _RF_read_byte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_rf.c" 263 (basetype 1 unsigned) split "r0x1005")
	.debuginfo complex-type (local-sym "_rxdata" 1 "BSP\bsp_rf.c" 265 (basetype 1 unsigned) split "r0x1005")
_RF_read_byte:
; 2 exit points
	.line	263, "BSP\bsp_rf.c"; 	unsigned char RF_read_byte(unsigned char addr)
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	267, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	268, "BSP\bsp_rf.c"; 	RF_spi_wrd(RF_R_REGISTER|addr);
	MOVR	r0x1005,W
	MCALL	_RF_spi_wrd
	.line	269, "BSP\bsp_rf.c"; 	rxdata = RF_spi_wrd(0);
	MOVIA	0x00
	MCALL	_RF_spi_wrd
	BANKSEL	r0x1005
	MOVAR	r0x1005
	.line	270, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	272, "BSP\bsp_rf.c"; 	return(rxdata);
	MOVR	r0x1005,W
	.line	273, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_read_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   _RF_spi_wrd
;   __gptrput1
;   _delay_us
;   _RF_spi_wrd
;   _RF_spi_wrd
;   __gptrput1
;   _delay_us
;9 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   STK01
;   r0x1018
;   STK02
;   r0x1019
;   STK03
;   r0x101A
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_read_buffer
	.debuginfo subprogram _RF_read_buffer
;local variable name mapping:
	.debuginfo complex-type (local-sym "_addr" 1 "BSP\bsp_rf.c" 248 (basetype 1 unsigned) split "r0x1016")
_RF_read_buffer:
; 2 exit points
	.line	248, "BSP\bsp_rf.c"; 	void RF_read_buffer(unsigned char addr, unsigned char* buf, unsigned char len)
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVR	STK00,W
	BANKSEL	r0x1017
	MOVAR	r0x1017
	MOVR	STK01,W
	BANKSEL	r0x1018
	MOVAR	r0x1018
	MOVR	STK02,W
	BANKSEL	r0x1019
	MOVAR	r0x1019
	MOVR	STK03,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	250, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	251, "BSP\bsp_rf.c"; 	RF_spi_wrd(RF_R_REGISTER | addr);
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	MCALL	_RF_spi_wrd
_02137_DS_:
	.line	253, "BSP\bsp_rf.c"; 	while(len--)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	r0x1016
	MOVAR	r0x1016
	BANKSEL	r0x101A
	DECR	r0x101A,F
	BANKSEL	r0x1016
	MOVR	r0x1016,W
	BTRSC	STATUS,2
	MGOTO	_02139_DS_
	.line	255, "BSP\bsp_rf.c"; 	*buf++ = RF_spi_wrd(0);
	MOVIA	0x00
	MCALL	_RF_spi_wrd
	BANKSEL	r0x1016
	MOVAR	r0x1016
	MOVR	r0x1016,W
	MOVAR	STK02
	BANKSEL	r0x1019
	MOVR	r0x1019,W
	MOVAR	STK01
	BANKSEL	r0x1018
	MOVR	r0x1018,W
	MOVAR	STK00
	BANKSEL	r0x1017
	MOVR	r0x1017,W
	MCALL	__gptrput1
	BANKSEL	r0x1019
	INCR	r0x1019,F
	BTRSS	STATUS,2
	MGOTO	_00005_DS_
	BANKSEL	r0x1018
	INCR	r0x1018,F
_00005_DS_:
	BTRSS	STATUS,2
	MGOTO	_00006_DS_
	BANKSEL	r0x1017
	INCR	r0x1017,F
_00006_DS_:
	MGOTO	_02137_DS_
_02139_DS_:
	.line	258, "BSP\bsp_rf.c"; 	delay_us(1);
	MOVIA	0x01
	MCALL	_delay_us
	.line	259, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	260, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_read_buffer

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_spi_wrd
;   _RF_spi_wrd
;1 compiler assigned register :
;   r0x101E
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Operation
	.debuginfo subprogram _RF_Operation
;local variable name mapping:
	.debuginfo complex-type (local-sym "_opt" 1 "BSP\bsp_rf.c" 238 (basetype 1 unsigned) split "r0x101E")
	.debuginfo complex-type (local-sym "_status" 1 "BSP\bsp_rf.c" 240 (basetype 1 unsigned) split "r0x101E")
_RF_Operation:
; 2 exit points
	.line	238, "BSP\bsp_rf.c"; 	unsigned char RF_Operation(unsigned char opt)
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	242, "BSP\bsp_rf.c"; 	RF_CSN_LOW;
	BCR	_PORTAbits,1
	.line	243, "BSP\bsp_rf.c"; 	status = RF_spi_wrd(opt);
	MOVR	r0x101E,W
	MCALL	_RF_spi_wrd
	BANKSEL	r0x101E
	MOVAR	r0x101E
	.line	244, "BSP\bsp_rf.c"; 	RF_CSN_HIGH;
	BSR	_PORTAbits,1
	.line	245, "BSP\bsp_rf.c"; 	return status;
	MOVR	r0x101E,W
	.line	246, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Operation

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_read_byte
;   _RF_write_byte
;   _RF_read_byte
;   _RF_write_byte
;   _RF_read_byte
;   _RF_write_byte
;   _RF_read_byte
;   _RF_write_byte
;4 compiler assigned registers:
;   r0x102C
;   r0x102D
;   r0x102E
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_ModeSwitch
	.debuginfo subprogram _RF_ModeSwitch
;local variable name mapping:
	.debuginfo complex-type (local-sym "_mod" 1 "BSP\bsp_rf.c" 215 (basetype 1 unsigned) split "r0x102C")
	.debuginfo complex-type (local-sym "_tmp" 1 "BSP\bsp_rf.c" 217 (basetype 1 unsigned) split "r0x102D")
_RF_ModeSwitch:
; 2 exit points
	.line	215, "BSP\bsp_rf.c"; 	void RF_ModeSwitch(RF_ModeTypeDef mod)
	BANKSEL	r0x102C
	MOVAR	r0x102C
	.line	219, "BSP\bsp_rf.c"; 	tmp = RF_read_byte(RF_BANK0_CONFIG);
	MOVIA	0x00
	MCALL	_RF_read_byte
	BANKSEL	r0x102D
	MOVAR	r0x102D
	.line	220, "BSP\bsp_rf.c"; 	if(mod != Rf_PRX_Mode)
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	BTRSC	STATUS,2
	MGOTO	_02124_DS_
	.line	222, "BSP\bsp_rf.c"; 	tmp &= 0xFE;
	MOVIA	0xfe
	BANKSEL	r0x102D
	ANDAR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MGOTO	_02125_DS_
_02124_DS_:
	.line	226, "BSP\bsp_rf.c"; 	tmp |= 0x01;
	MOVIA	0x01
	BANKSEL	r0x102D
	IORAR	r0x102D,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
_02125_DS_:
	.line	228, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_CONFIG, tmp);
	BANKSEL	r0x102E
	MOVR	r0x102E,W
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_RF_write_byte
	.line	230, "BSP\bsp_rf.c"; 	if(mod == Rf_Carrier_Mode)
	BANKSEL	r0x102C
	MOVR	r0x102C,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02128_DS_
	.line	232, "BSP\bsp_rf.c"; 	tmp = 0x80 | RF_read_byte(RF_BANK0_RF_SETUP);
	MOVIA	0x06
	MCALL	_RF_read_byte
	BANKSEL	r0x102C
	MOVAR	r0x102C
	BSR	r0x102C,7
	.line	233, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_RF_SETUP, tmp);
	MOVR	r0x102C,W
	MOVAR	STK00
	MOVIA	0x06
	MCALL	_RF_write_byte
_02128_DS_:
	.line	235, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_ModeSwitch

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Bank_Switch
;   _RF_read_byte
;   _RF_Bank_Switch
;   _RF_read_byte
;2 compiler assigned registers:
;   r0x102F
;   r0x1030
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Get_RSSI
	.debuginfo subprogram _RF_Get_RSSI
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ReadArr" 1 "BSP\bsp_rf.c" 203 (basetype 1 unsigned) split "r0x102F")
_RF_Get_RSSI:
; 2 exit points
	.line	205, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_RF_Bank_Switch
	.line	206, "BSP\bsp_rf.c"; 	ReadArr = RF_read_byte(RF_BANK0_RPD);
	MOVIA	0x09
	MCALL	_RF_read_byte
	BANKSEL	r0x102F
	MOVAR	r0x102F
	.line	208, "BSP\bsp_rf.c"; 	return ((signed char)ReadArr);
	MOVR	r0x102F,W
	BANKSEL	r0x1030
	MOVAR	r0x1030
	MOVR	r0x1030,W
	.line	209, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Get_RSSI

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1031
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Get_Chip_ID
	.debuginfo subprogram _RF_Get_Chip_ID
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ReadArr" 2 "BSP\bsp_rf.c" 177 (array 2 (basetype 1 unsigned)) link "_RF_Get_Chip_ID_ReadArr_65536_61")
_RF_Get_Chip_ID:
; 2 exit points
	.line	195, "BSP\bsp_rf.c"; 	return ReadArr[1];
	BANKSEL	_RF_Get_Chip_ID_ReadArr_65536_61
	MOVR	(_RF_Get_Chip_ID_ReadArr_65536_61 + 1),W
	BANKSEL	r0x1031
	MOVAR	r0x1031
	MOVR	r0x1031,W
	.line	196, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Get_Chip_ID

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Operation
;   _RF_Operation
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Flush_Tx
	.debuginfo subprogram _RF_Flush_Tx
_RF_Flush_Tx:
; 2 exit points
	.line	172, "BSP\bsp_rf.c"; 	RF_Operation(RF_FLUSH_TX);
	MOVIA	0xe1
	MCALL	_RF_Operation
	.line	173, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Flush_Tx

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Operation
;   _RF_Operation
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Flush_Rx
	.debuginfo subprogram _RF_Flush_Rx
_RF_Flush_Rx:
; 2 exit points
	.line	166, "BSP\bsp_rf.c"; 	RF_Operation(RF_FLUSH_RX);
	MOVIA	0xe2
	MCALL	_RF_Operation
	.line	167, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Flush_Rx

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   _RF_wr_buffer
;   __gptrget1
;   __gptrget1
;   _RF_wr_buffer
;14 compiler assigned registers:
;   r0x1032
;   STK00
;   r0x1033
;   STK01
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   STK03
;   STK02
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Configure_Reg
	.debuginfo subprogram _RF_Configure_Reg
;local variable name mapping:
	.debuginfo complex-type (local-sym "_Dbuf" 3 "BSP\bsp_rf.c" 133 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1034" "r0x1033" "r0x1032")
	.debuginfo complex-type (local-sym "_cnt" 1 "BSP\bsp_rf.c" 135 (basetype 1 unsigned) split "r0x1035")
	.debuginfo complex-type (local-sym "_Reg_Addr" 1 "BSP\bsp_rf.c" 136 (basetype 1 unsigned) split "r0x1039")
	.debuginfo complex-type (local-sym "_data_lenth" 1 "BSP\bsp_rf.c" 137 (basetype 1 unsigned) split "r0x103B")
	.debuginfo complex-type (local-sym "_p_data" 3 "BSP\bsp_rf.c" 138 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1037" "r0x1038" "r0x103A")
_RF_Configure_Reg:
; 2 exit points
	.line	133, "BSP\bsp_rf.c"; 	void RF_Configure_Reg(const unsigned char* Dbuf)
	BANKSEL	r0x1032
	MOVAR	r0x1032
	MOVR	STK00,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVR	STK01,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	.line	135, "BSP\bsp_rf.c"; 	unsigned char cnt = 0;
	BANKSEL	r0x1035
	CLRR	r0x1035
_02088_DS_:
	.line	143, "BSP\bsp_rf.c"; 	Reg_Addr = Dbuf[cnt];
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	BANKSEL	r0x1035
	ADDAR	r0x1035,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	ADCIA	0x00
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	MOVAR	STK01
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK00
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	MCALL	__gptrget1
	BANKSEL	r0x1039
	MOVAR	r0x1039
	.line	144, "BSP\bsp_rf.c"; 	if(0xFF == Reg_Addr)
	MOVR	r0x1039,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02102_DS_
	MGOTO	_02090_DS_
_02102_DS_:
	.line	150, "BSP\bsp_rf.c"; 	cnt += 1;
	BANKSEL	r0x1035
	INCR	r0x1035,W
	BANKSEL	r0x1036
	MOVAR	r0x1036
	.line	151, "BSP\bsp_rf.c"; 	data_lenth = Dbuf[cnt];
	MOVR	r0x1036,W
	BANKSEL	r0x1034
	ADDAR	r0x1034,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	ADCIA	0x00
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK01
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	MOVAR	STK00
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MCALL	__gptrget1
	BANKSEL	r0x103B
	MOVAR	r0x103B
	.line	154, "BSP\bsp_rf.c"; 	cnt += 1;
	BANKSEL	r0x1036
	INCR	r0x1036,F
	.line	155, "BSP\bsp_rf.c"; 	p_data = &Dbuf[cnt];
	MOVR	r0x1036,W
	BANKSEL	r0x1034
	ADDAR	r0x1034,W
	BANKSEL	r0x1037
	MOVAR	r0x1037
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	ADCIA	0x00
	BANKSEL	r0x1038
	MOVAR	r0x1038
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BANKSEL	r0x103A
	MOVAR	r0x103A
	.line	158, "BSP\bsp_rf.c"; 	RF_wr_buffer(Reg_Addr, p_data, data_lenth);
	BANKSEL	r0x103B
	MOVR	r0x103B,W
	MOVAR	STK03
	BANKSEL	r0x1037
	MOVR	r0x1037,W
	MOVAR	STK02
	BANKSEL	r0x1038
	MOVR	r0x1038,W
	MOVAR	STK01
	BANKSEL	r0x103A
	MOVR	r0x103A,W
	MOVAR	STK00
	BANKSEL	r0x1039
	MOVR	r0x1039,W
	MCALL	_RF_wr_buffer
	.line	159, "BSP\bsp_rf.c"; 	cnt += data_lenth;
	BANKSEL	r0x1036
	MOVR	r0x1036,W
	BANKSEL	r0x103B
	ADDAR	r0x103B,W
	BANKSEL	r0x1035
	MOVAR	r0x1035
	MGOTO	_02088_DS_
_02090_DS_:
	.line	161, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Configure_Reg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_write_byte
;   _RF_write_byte
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Clear_All_Irq
	.debuginfo subprogram _RF_Clear_All_Irq
_RF_Clear_All_Irq:
; 2 exit points
	.line	129, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_STATUS, 0x70);
	MOVIA	0x70
	MOVAR	STK00
	MOVIA	0x07
	MCALL	_RF_write_byte
	.line	130, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Clear_All_Irq

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_Bank_Switch
;   __muluchar
;   _RF_wr_buffer
;   _RF_Bank_Switch
;   __gptrget1
;   _RF_write_byte
;   _RF_Bank_Switch
;   __muluchar
;   _RF_wr_buffer
;   _RF_Bank_Switch
;   __gptrget1
;   _RF_write_byte
;11 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Change_Pwr
	.debuginfo subprogram _RF_Change_Pwr
;local variable name mapping:
	.debuginfo complex-type (local-sym "_Pwr_dBm" 1 "BSP\bsp_rf.c" 77 (basetype 1 signed) split "r0x103C")
	.debuginfo complex-type (local-sym "_Pwr_Sel" 1 "BSP\bsp_rf.c" 79 (basetype 1 unsigned) split "r0x103C")
_RF_Change_Pwr:
; 2 exit points
	.line	77, "BSP\bsp_rf.c"; 	void RF_Change_Pwr(signed char Pwr_dBm)
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	81, "BSP\bsp_rf.c"; 	switch(Pwr_dBm)
	MOVR	r0x103C,W
	XORIA	0xd5
	BTRSS	STATUS,2
	MGOTO	_02069_DS_
	MGOTO	_02025_DS_
_02069_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0xf0
	BTRSS	STATUS,2
	MGOTO	_02070_DS_
	MGOTO	_02026_DS_
_02070_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0xf4
	BTRSS	STATUS,2
	MGOTO	_02071_DS_
	MGOTO	_02027_DS_
_02071_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0xfa
	BTRSS	STATUS,2
	MGOTO	_02072_DS_
	MGOTO	_02028_DS_
_02072_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	BTRSS	STATUS,2
	MGOTO	_02073_DS_
	MGOTO	_02029_DS_
_02073_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0x04
	BTRSS	STATUS,2
	MGOTO	_02074_DS_
	MGOTO	_02030_DS_
_02074_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0x05
	BTRSS	STATUS,2
	MGOTO	_02075_DS_
	MGOTO	_02031_DS_
_02075_DS_:
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	XORIA	0x08
	BTRSS	STATUS,2
	MGOTO	_02076_DS_
	MGOTO	_02032_DS_
_02076_DS_:
	MGOTO	_02033_DS_
_02025_DS_:
	.line	84, "BSP\bsp_rf.c"; 	Pwr_Sel = 0;
	BANKSEL	r0x103C
	CLRR	r0x103C
	.line	85, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02026_DS_:
	.line	88, "BSP\bsp_rf.c"; 	Pwr_Sel = 1;
	MOVIA	0x01
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	89, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02027_DS_:
	.line	92, "BSP\bsp_rf.c"; 	Pwr_Sel = 2;
	MOVIA	0x02
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	93, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02028_DS_:
	.line	96, "BSP\bsp_rf.c"; 	Pwr_Sel = 3;
	MOVIA	0x03
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	97, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02029_DS_:
	.line	100, "BSP\bsp_rf.c"; 	Pwr_Sel = 4;
	MOVIA	0x04
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	101, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02030_DS_:
	.line	104, "BSP\bsp_rf.c"; 	Pwr_Sel = 5;
	MOVIA	0x05
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	105, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02031_DS_:
	.line	108, "BSP\bsp_rf.c"; 	Pwr_Sel = 6;
	MOVIA	0x06
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	109, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02032_DS_:
	.line	112, "BSP\bsp_rf.c"; 	Pwr_Sel = 7;
	MOVIA	0x07
	BANKSEL	r0x103C
	MOVAR	r0x103C
	.line	113, "BSP\bsp_rf.c"; 	break;
	MGOTO	_02034_DS_
_02033_DS_:
	.line	116, "BSP\bsp_rf.c"; 	Pwr_Sel = 4;
	MOVIA	0x04
	BANKSEL	r0x103C
	MOVAR	r0x103C
_02034_DS_:
	.line	120, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank1);
	MOVIA	0x01
	MCALL	_RF_Bank_Switch
	.line	121, "BSP\bsp_rf.c"; 	RF_wr_buffer(RF_BANK1_RF_IVGEN, &RF_Tx_Power[Pwr_Sel][1], 4);
	MOVIA	0x05
	MOVAR	STK00
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	MCALL	__muluchar
	BANKSEL	r0x103D
	MOVAR	r0x103D
	MOVR	STK00,W
	BANKSEL	r0x103C
	MOVAR	r0x103C
	MOVR	r0x103C,W
	ADDIA	(_RF_Tx_Power + 0)
	MOVAR	r0x103C
	MOVIA	((_RF_Tx_Power + 0) >> 8) & 0xff
	BANKSEL	r0x103D
	ADCAR	r0x103D,F
	MOVIA	0x01
	BANKSEL	r0x103C
	ADDAR	r0x103C,W
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVIA	0x00
	BANKSEL	r0x103D
	ADCAR	r0x103D,W
	BANKSEL	r0x103F
	MOVAR	r0x103F
	MOVR	r0x103F,W
	BANKSEL	r0x1040
	MOVAR	r0x1040
	BANKSEL	r0x103E
	MOVR	r0x103E,W
	BANKSEL	r0x1041
	MOVAR	r0x1041
	MOVIA	0x80
	BANKSEL	r0x1042
	MOVAR	r0x1042
	MOVIA	0x04
	MOVAR	STK03
	BANKSEL	r0x1041
	MOVR	r0x1041,W
	MOVAR	STK02
	BANKSEL	r0x1040
	MOVR	r0x1040,W
	MOVAR	STK01
	BANKSEL	r0x1042
	MOVR	r0x1042,W
	MOVAR	STK00
	MOVIA	0x1e
	MCALL	_RF_wr_buffer
	.line	122, "BSP\bsp_rf.c"; 	RF_Bank_Switch(RF_Bank0);
	MOVIA	0x00
	MCALL	_RF_Bank_Switch
	.line	123, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_RF_SETUP, RF_Tx_Power[Pwr_Sel][0]);
	BANKSEL	r0x103C
	MOVR	r0x103C,W
	MOVAR	STK01
	BANKSEL	r0x103D
	MOVR	r0x103D,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x103E
	MOVAR	r0x103E
	MOVR	r0x103E,W
	MOVAR	STK00
	MOVIA	0x06
	MCALL	_RF_write_byte
	.line	124, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Change_Pwr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_write_byte
;   _RF_write_byte
;2 compiler assigned registers:
;   r0x1043
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Change_CH
	.debuginfo subprogram _RF_Change_CH
;local variable name mapping:
	.debuginfo complex-type (local-sym "_ch_index" 1 "BSP\bsp_rf.c" 69 (basetype 1 unsigned) split "r0x1043")
_RF_Change_CH:
; 2 exit points
	.line	69, "BSP\bsp_rf.c"; 	void RF_Change_CH(unsigned char ch_index)
	BANKSEL	r0x1043
	MOVAR	r0x1043
	.line	71, "BSP\bsp_rf.c"; 	RF_write_byte(RF_BANK0_RF_CH, ch_index);
	MOVR	r0x1043,W
	MOVAR	STK00
	MOVIA	0x05
	MCALL	_RF_write_byte
	.line	72, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Change_CH

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_wr_buffer
;   _RF_wr_buffer
;   _RF_wr_buffer
;   _RF_wr_buffer
;8 compiler assigned registers:
;   r0x1044
;   STK00
;   r0x1045
;   STK01
;   r0x1046
;   STK02
;   r0x1047
;   STK03
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_ChangeAddr_Reg
	.debuginfo subprogram _RF_ChangeAddr_Reg
;local variable name mapping:
	.debuginfo complex-type (local-sym "_AddrBuf" 3 "BSP\bsp_rf.c" 58 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1046" "r0x1045" "r0x1044")
	.debuginfo complex-type (local-sym "_len" 1 "BSP\bsp_rf.c" 58 (basetype 1 unsigned) split "r0x1047")
_RF_ChangeAddr_Reg:
; 2 exit points
	.line	58, "BSP\bsp_rf.c"; 	void RF_ChangeAddr_Reg(unsigned char* AddrBuf,unsigned char len)
	BANKSEL	r0x1044
	MOVAR	r0x1044
	MOVR	STK00,W
	BANKSEL	r0x1045
	MOVAR	r0x1045
	MOVR	STK01,W
	BANKSEL	r0x1046
	MOVAR	r0x1046
	MOVR	STK02,W
	BANKSEL	r0x1047
	MOVAR	r0x1047
	.line	60, "BSP\bsp_rf.c"; 	RF_wr_buffer(RF_BANK0_RX_ADDR_P0, AddrBuf, len);
	MOVR	r0x1047,W
	MOVAR	STK03
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	MOVIA	0x0a
	MCALL	_RF_wr_buffer
	.line	61, "BSP\bsp_rf.c"; 	RF_wr_buffer(RF_BANK0_TX_ADDR, AddrBuf,len);
	BANKSEL	r0x1047
	MOVR	r0x1047,W
	MOVAR	STK03
	BANKSEL	r0x1046
	MOVR	r0x1046,W
	MOVAR	STK02
	BANKSEL	r0x1045
	MOVR	r0x1045,W
	MOVAR	STK01
	BANKSEL	r0x1044
	MOVR	r0x1044,W
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_RF_wr_buffer
	.line	62, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_ChangeAddr_Reg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _RF_read_byte
;   _RF_wr_cmd
;   _RF_wr_cmd
;   _RF_read_byte
;   _RF_wr_cmd
;   _RF_wr_cmd
;3 compiler assigned registers:
;   r0x1007
;   r0x1008
;   STK00
;; Starting pCode block
.segment "code"; module=bsp_rf, function=_RF_Bank_Switch
	.debuginfo subprogram _RF_Bank_Switch
;local variable name mapping:
	.debuginfo complex-type (local-sym "_bank" 1 "BSP\bsp_rf.c" 29 (basetype 1 unsigned) split "r0x1007")
	.debuginfo complex-type (local-sym "_sta" 1 "BSP\bsp_rf.c" 31 (basetype 1 unsigned) split "r0x1008")
_RF_Bank_Switch:
; 2 exit points
	.line	29, "BSP\bsp_rf.c"; 	void RF_Bank_Switch(RF_Bank_TypeDef bank)
	BANKSEL	r0x1007
	MOVAR	r0x1007
	.line	34, "BSP\bsp_rf.c"; 	sta = RF_read_byte(RF_BANK0_STATUS);
	MOVIA	0x07
	MCALL	_RF_read_byte
	BANKSEL	r0x1008
	MOVAR	r0x1008
	.line	36, "BSP\bsp_rf.c"; 	if(bank!= RF_BANK0)
	BANKSEL	r0x1007
	MOVR	r0x1007,W
	BTRSC	STATUS,2
	MGOTO	_02010_DS_
	.line	39, "BSP\bsp_rf.c"; 	if(!(sta & RF_BANK1))
	BANKSEL	r0x1008
	BTRSC	r0x1008,7
	MGOTO	_02012_DS_
	.line	42, "BSP\bsp_rf.c"; 	RF_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
	MOVIA	0x53
	MOVAR	STK00
	MOVIA	0x50
	MCALL	_RF_wr_cmd
	MGOTO	_02012_DS_
_02010_DS_:
	.line	48, "BSP\bsp_rf.c"; 	if(sta & RF_BANK1)
	BANKSEL	r0x1008
	BTRSS	r0x1008,7
	MGOTO	_02012_DS_
	.line	51, "BSP\bsp_rf.c"; 	RF_wr_cmd(RF_ACTIVATE, RF_ACTIVATE_DATA);
	MOVIA	0x53
	MOVAR	STK00
	MOVIA	0x50
	MCALL	_RF_wr_cmd
_02012_DS_:
	.line	54, "BSP\bsp_rf.c"; 	}
	RETURN	
; exit point of _RF_Bank_Switch


;	code size estimation:
;	  587+  217 =   804 instructions ( 2042 byte)

	end
