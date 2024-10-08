#ifndef APPTX_H
#define APPTX_H

#define CS1630_BANK0_CONFIG_RESET_VALUE             0x0a
#define CS1630_BANK0_SETUP_AW_RESET_VALUE           0x0b
#define CS1630_BANK0_RF_CH_RESET_VALUE              0x32
#define CS1630_BANK0_RF_SETUP_RESET_VALUE           0x05
#define CS1630_BANK0_STATUS_RESET_VALUE             0x00
#define CS1630_BANK0_KEY_VALUE_RESET_VALUE          0x00
#define CS1630_BANK0_PRE_LEN_RESET_VALUE            0x00
#define CS1630_BANK0_TX_ADDR_RESET_VALUE            0x6b6b7d917146UL
#define CS1630_BANK0_FIFO_STATUS_RESET_VALUE        0x10
#define CS1630_BANK0_RPD_0_RESET_VALUE              0x00
#define CS1630_BANK0_FEATURE_RESET_VALUE            0x00
#define CS1630_BANK0_SETUP_VALUE_RESET_VALUE        0x063202UL
#define CS1630_BANK0_PRE_GURD_RESET_VALUE           0x000077UL

#define CS1630_BANK1_LINE_RESET_VALUE               0x0570
#define CS1630_BANK1_PLL_CTL0_RESET_VALUE           0x02000014UL
#define CS1630_BANK1_FAGC_CTRL_RESET_VALUE          0x010a0004UL
#define CS1630_BANK1_TEST_PKDET_RESET_VALUE         0x0000009fUL
#define CS1630_BANK1_PLL_CTL1_RESET_VALUE           0x60104200UL
#define CS1630_BANK1_STATUS_RESET_VALUE             0x80
#define CS1630_BANK1_CTUNING_RESET_VALUE            0x00
#define CS1630_BANK1_FTUNING_RESET_VALUE            0x00
#define CS1630_BANK1_FDEV_RESET_VALUE               0x20
#define CS1630_BANK1_DAC_RANGE_RESET_VALUE          0x00
#define CS1630_BANK1_CHAN_RESET_VALUE               0x99

//volatile unsigned char key_long_int_status;
void send_ble_packet(unsigned char code_value, unsigned char send_times, unsigned char Serial_Number);

#endif
