/*****************************************************************************************************************/
//* 使用线反转法对按键状态进行检测
/*****************************************************************************************************************/
#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"
#include "app_tx.h"
#include "bsp_usart.h"

static unsigned char Serial_Number = 0;

void set_PA_low(void)
{
    PORTAbits.PA2 = 0;
    PORTAbits.PA3 = 0;
    PORTAbits.PA4 = 0;
    PORTAbits.PA5 = 0;
    PORTAbits.PA6 = 0;
}

void set_PB_low(void)
{
    PORTBbits.PB0 = 0;
    PORTBbits.PB1 = 0;
    PORTBbits.PB2 = 0;
    PORTBbits.PB3 = 0;
}

void key_init(void)
{
    delay_ms(1);
    // 配置PA按钮
	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入

    APHCON = 0b00100011; // 设置2、3、4、6、7上拉

	PCON = 0xc8; // 设置5上拉

    //配置PB按钮
	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output | C_PB4_Output; // 配置PB为输出低电平
	set_PB_low();
	PORTBbits.PB4 = 0;
}

void toggle_key(void)
{
    APHCON = 0b01111111; // 2、3、4、6上拉取消
    PCON = 0xe8; // 5上拉取消
    IOSTA = 0b10000000; // 配置PA2、3、4、5为输出低电平
    set_PA_low();

    IOSTB = 0b00001111; // 配置PB0、1、2、3为输入
    BPHCON = 0xF0; // 0、1、2、3上拉
}

unsigned char Check_Keydown()
{
    unsigned char KeyValue=0;
    unsigned char KeyStatus = 0;

    KeyStatus = PORTA;
    KeyStatus = KeyStatus & 0xfc;

    if(KeyStatus != 0xfc)
    {
        delay_ms(4);
        KeyStatus = PORTA;
        KeyStatus = KeyStatus & 0xfc;
        if(KeyStatus != 0xfc)
        {
            if(!PORTAbits.PA7)
            {
                KeyValue=0x15;
                return KeyValue;
            }

            KeyStatus = KeyStatus & 0x7c;

            /***********************************************************/
            /*         PA2  PA3 PA4 PA5 PA6         1  2  3  4  5      */
            /*    PB3  0    1   2   3   4           0  1  2  3  4  5   */
            /*    PB2  5    6   7   8   9           5  6  7  8  9  A   */
            /*    PB1  a    b   c   d   e           A  B  C  D  E  F   */
            /*    PB0  f   10  11  12  13           F  10 11 12 13 14  */
            /***********************************************************/

            switch(KeyStatus)
            {
                case(0X78): KeyValue = 0x01;break;
                case(0X74): KeyValue = 0x02;break;
                case(0X6C): KeyValue = 0x03;break;
                case(0X5C): KeyValue = 0x04;break;
                case(0X3C): KeyValue = 0x05;break; // PA6
                default:KeyValue = 0x00;break;
            }

            toggle_key();
            KeyStatus = 0;
            KeyStatus = PORTB;
            KeyStatus = KeyStatus & 0x0f;

            switch(KeyStatus)
            {
                case(0x07): KeyValue = KeyValue;break; // PB3
                case(0x0B): KeyValue = KeyValue+0x05;break;
                case(0x0D): KeyValue = KeyValue+0x0a;break;
                case(0x0E): KeyValue = KeyValue+0x0f;break;
                default:KeyValue = 0x00;break;
            }
            CLRWDT();
            return KeyValue;
        }
        else
        {
            return 0;
        }
    }
    return 0;
}