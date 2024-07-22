#include "bsp_rf.h"
#include "bsp_CS1630.h"
#include "bsp_delay.h"
#include "app_tx.h"
//#include "bsp_usart.h"

static unsigned char CS1630_Tx_Payload[32];
static const unsigned char channel_index[3] = {
                                                2,  // 2.402G  // 37
                                                26, // 2.426G  // 38
                                                80  // 2.480G  // 39
                                              };
static unsigned char s_data_num = 0;
void send_ble_packet(unsigned char code_value)
{
    unsigned char i = 0;             // 循环计数器
    unsigned char j = 0;             // 循环计数器
    unsigned char idx = 0;           // 用于遍历频道索引的计数器
    unsigned char len = 1;           // 用于计算数据包长度的变量
    unsigned char status = 0x00;     // 状态寄存器，用于读取发送状态

    s_data_num++;

    CS1630_Init(); // 初始化CS1630模块
    CS1630_CE_Low(); // 设置CE引脚为低电平，准备发送数据
    CS1630_ModeSwitch(Rf_PTX_Mode); // 切换到发送模式

    // 配置CS1630模块的寄存器
    CS1630_write_byte(CS1630_BANK0_FEATURE, 0x04);
    CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0e);
    CS1630_write_byte(CS1630_BANK0_SETUP_VALUE, 0x04); // 配置值
    // 构建数据包
    len = 0; // 重置长度计数器
    CS1630_Tx_Payload[len ++] = 0x02;       // 数据包长度的首字节
    CS1630_Tx_Payload[len ++] = 0x01;       // 数据包类型
    CS1630_Tx_Payload[len ++] = 0x06;       // 标志位，包括可发现模式和支持的蓝牙技术类型
    // 标志位注释解释：
    // bit0: (OFF) LE Limited Discoverable Mode
    // bit 1 (ON) LE General Discoverable Mode
    // bit 2 (ON) BR/EDR Not Supported
    // bit 3 (OFF) Simultaneous LE and BR/EDR to Same Device Capable (controller)
    // bit 4 (OFF) Simultaneous LE and BR/EDR to Same Device Capable (Host)
    CS1630_Tx_Payload[len ++] = 0x10;
    CS1630_Tx_Payload[len ++] = 0xFF;

    CS1630_Tx_Payload[len ++] = 0x54;       // 同步系列
    CS1630_Tx_Payload[len ++] = 0x45;       // 同步系列
	CS1630_Tx_Payload[len ++] = s_data_num; // 序号，用于区分不同数据包
	CS1630_Tx_Payload[len ++] = code_value; // 码值，用于指示功能
	CS1630_Tx_Payload[len ++] = 0xBF;       // 识别码
	CS1630_Tx_Payload[len ++] = 0xAA;       // 识别码
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;
	CS1630_Tx_Payload[len ++] = 0xFF;

    // 发送数据包的循环
    for(i = 0; i < 3; i++)
    {
        // 重置CE，清空TX缓冲区，清除所有中断
        CS1630_CE_Low();
        CS1630_Flush_Tx();
        CS1630_Clear_All_Irq();

        // 配置寄存器以发送数据
        CS1630_write_byte(CS1630_BANK0_CONFIG, 0x0e);
        delay_ms(5);

        // 遍历频道索引数组，发送数据
        for(idx = 0; idx < 3; idx++)
        {
            CS1630_write_byte(CS1630_BANK0_RF_CH, channel_index[idx]); // 设置射频频道
            CS1630_SendPack(RF_W_TX_PAYLOAD, CS1630_Tx_Payload, len); // 发送数据包
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

        // 重置配置寄存器
        CS1630_write_byte(CS1630_BANK0_CONFIG, 0x00);
        delay_ms(1);
    }
}