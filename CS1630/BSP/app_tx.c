#include "bsp_rf.h"
#include "bsp_CS1630.h"
#include "bsp_delay.h"
#include "app_tx.h"
//#include "bsp_usart.h"
unsigned char rolling_code_0;
unsigned char rolling_code_1;
unsigned char rolling_code_2;
volatile unsigned char key_status_change = 0;
volatile unsigned char one_key_twice_dowm = 0;
static unsigned char CS1630_Tx_Payload[32] = {
    0x02, // 数据包长度的首字节
    0x01, // 数据包类型
    0x06, // 标志位
    0x10,
    0xFF,
    0x54, // 同步系列
    0x45, // 同步系列
    0x00, // 序号
    0x00, // 码值
    0xBF, // 识别码
    0xAA, // 识别码
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xFF,
    0xFF
};
static const unsigned char channel_index[3] = {
                                                2,  // 2.402G  // 37
                                                26, // 2.426G  // 38
                                                80  // 2.480G  // 39
                                              };

void send_ble_packet(unsigned char code_value, unsigned char send_times, unsigned char Serial_Number)
{
    CLRWDT();
    unsigned char mini_circle = 0;             // 循环计数器
    unsigned char great_circle = 0;             // 循环计数器
    unsigned char idx = 0;           // 用于遍历频道索引的计数器
    unsigned char status = 0x00;     // 状态寄存器，用于读取发送状态
    unsigned char enter_interput_times = 0;

    // 开启gpio变化中断
    AWUCON = 0xfc;
    BWUCON = 0x00;
    IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
    APHCON = 0b00100011; // 设置2、3、4、6、7上拉

    INTE = C_INT_PABKey;
    INTF = 0x00;

    // 构建数据包
    CS1630_Tx_Payload[7] = Serial_Number; // 序号，用于区分不同数据包
    CS1630_Tx_Payload[8] = code_value; // 码值，用于指示功能
    CS1630_Tx_Payload[11] = rolling_code_0; // 码值，用于指示功能
    CS1630_Tx_Payload[12] = rolling_code_1; // 码值，用于指示功能
    CS1630_Tx_Payload[13] = rolling_code_2; // 码值，用于指示功能
    // 重置CE，清空TX缓冲区，清除所有中断
    CS1630_CE_Low();
    CS1630_Flush_Tx();
    CS1630_Clear_All_Irq();

    // 配置寄存器以发送数据
    CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0f);
    delay_ms(5);

    CLRWDT();
    PB4 = 1;
    // 遍历频道索引数组，发送数据
    for(idx = 0; idx < 3; idx++)
    {
        CLRWDT();
        CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
        for(mini_circle = 0; mini_circle < 3; mini_circle++)
        {
            CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
            CS1630_CE_High(); // 产生CE脉冲，开始发送
            delay_40us(); // 等待脉冲稳定
            CS1630_CE_Low(); // 结束脉冲
            // 等待数据发送完成
            while(1)
            {
                status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
                if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
                {
                    CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
                    break;
                }
            }
        }
    }
    PB4 = 0;
    key_status_change = 0;
    // 发送数据包的循环
    for(great_circle = 0; great_circle < send_times; great_circle++)
    {
        CLRWDT();
        // 遍历频道索引数组，发送数据
        for(idx = 0; idx < 3; idx++)
        {
            CLRWDT();
            CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
            for(mini_circle = 0; mini_circle < 3; mini_circle++)
            {
                CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, 0x14); // 发送数据包
                CS1630_CE_High(); // 产生CE脉冲，开始发送
                delay_40us(); // 等待脉冲稳定
                CS1630_CE_Low(); // 结束脉冲
                // 等待数据发送完成
                while(1)
                {
                    status = CS1630_read_byte(CS1630_BANK0_STATUS); // 读取状态寄存器
                    if ((TX_DS & status) || (MAX_RT & status)) // 检查发送完成或重传达到最大次数
                    {
                        CS1630_write_byte(CS1630_BANK0_STATUS, status); // 清除状态
                        break;
                    }
                }
            }
        }

        if(key_status_change == 1)
        {
            key_status_change = 0;
            enter_interput_times++;
            if(enter_interput_times == 2)
            {
                one_key_twice_dowm = 1;
                enter_interput_times = 0;
                CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
                delay_ms(2);
                return;
            }
        }
    }

    // 重置配置寄存器
    CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0d);
    delay_ms(2);
}