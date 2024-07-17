//------------------------------------------------------------------------------------
// app_ble.h
//------------------------------------------------------------------------------------
// Copyright 2019, HunterSun Electronics Co., Ltd.
// crazy_code@yeah.net
// 2019-07-18
//
// Program Description:
//
//
//
#ifndef USER_HS6230TEST_H
#define USER_HS6230TEST_H

#define HS6230_BANK0_CONFIG_RESET_VALUE             0x0a
#define HS6230_BANK0_SETUP_AW_RESET_VALUE           0x0b
#define HS6230_BANK0_RF_CH_RESET_VALUE              0x32
#define HS6230_BANK0_RF_SETUP_RESET_VALUE           0x05
#define HS6230_BANK0_STATUS_RESET_VALUE             0x00
#define HS6230_BANK0_KEY_VALUE_RESET_VALUE          0x00
#define HS6230_BANK0_PRE_LEN_RESET_VALUE            0x00
#define HS6230_BANK0_TX_ADDR_RESET_VALUE            0x6b6b7d917146UL
#define HS6230_BANK0_FIFO_STATUS_RESET_VALUE        0x10
#define HS6230_BANK0_RPD_0_RESET_VALUE              0x00
#define HS6230_BANK0_FEATURE_RESET_VALUE            0x00
#define HS6230_BANK0_SETUP_VALUE_RESET_VALUE        0x063202UL
#define HS6230_BANK0_PRE_GURD_RESET_VALUE           0x000077UL

#define HS6230_BANK1_LINE_RESET_VALUE               0x0570
#define HS6230_BANK1_PLL_CTL0_RESET_VALUE           0x02000014UL
#define HS6230_BANK1_FAGC_CTRL_RESET_VALUE          0x010a0004UL
#define HS6230_BANK1_TEST_PKDET_RESET_VALUE         0x0000009fUL
#define HS6230_BANK1_PLL_CTL1_RESET_VALUE           0x60104200UL
#define HS6230_BANK1_STATUS_RESET_VALUE             0x80
#define HS6230_BANK1_CTUNING_RESET_VALUE            0x00
#define HS6230_BANK1_FTUNING_RESET_VALUE            0x00
#define HS6230_BANK1_FDEV_RESET_VALUE               0x20
#define HS6230_BANK1_DAC_RANGE_RESET_VALUE          0x00
#define HS6230_BANK1_CHAN_RESET_VALUE               0x99

void send_rf_packet_test(unsigned char guard_en);
void send_ble_packet_test(void);

#endif
