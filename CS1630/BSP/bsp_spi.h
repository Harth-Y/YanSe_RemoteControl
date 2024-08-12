#ifndef __BSP_SPI_H__
#define __BSP_SPI_H__

#define NOP_DELAY()					NOP();NOP();NOP();

#define RF_CSN_PIN					PA1
#define RF_SCK_PIN					PA0
#define RF_SDA_PIN					PB5
#define RF_SDIO_PIN					PB5

#define RF_CSN_H()					do{ NOP_DELAY(); PORTAbits.RF_CSN_PIN = 1; NOP_DELAY();}while(0)
#define RF_CSN_L()					do{ NOP_DELAY(); PORTAbits.RF_CSN_PIN = 0; NOP_DELAY();}while(0)
#define RF_SCK_H()					do{ NOP_DELAY(); PORTAbits.RF_SCK_PIN = 1;   NOP_DELAY();}while(0)
#define RF_SCK_L()					do{ NOP_DELAY(); PORTAbits.RF_SCK_PIN = 0;   NOP_DELAY();}while(0)
#define RF_MOSI_H()					do{ NOP_DELAY(); PORTBbits.RF_SDA_PIN = 1; NOP_DELAY();}while(0)
#define RF_MOSI_L()					do{ NOP_DELAY(); PORTBbits.RF_SDA_PIN = 0; NOP_DELAY();}while(0)
#define RF_SDIO_H()					do{ NOP_DELAY(); PORTBbits.RF_SDIO_PIN = 1; NOP_DELAY();}while(0)
#define RF_SDIO_L()					do{ NOP_DELAY(); PORTBbits.RF_SDIO_PIN = 0; NOP_DELAY();}while(0)

#define RF_Reag_SDIO()				PORTBbits.RF_SDIO_PIN

#define RF_CS_HIGH()				RF_CSN_H()
#define RF_CS_LOW()					RF_CSN_L()

void RF_softSPI_Init(void);
void SPI_SendByte(unsigned char TxData);
unsigned char SPI_ReadByte(void);

#endif  /*__BSP_SPI_H__*/
/*-------------------------------------------End Of File---------------------------------------------*/
