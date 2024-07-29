#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"
#include "app_tx.h"
//#include "bsp_usart.h"

void set_PA_low(void)
{
    PORTAbits.PA2 = 0;
    PORTAbits.PA3 = 0;
    PORTAbits.PA4 = 0;
    PORTAbits.PA5 = 0;
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
    // 配置PA按钮
	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input | C_PA7_Input;  // 配置PA2、3、4、5、6、7为输入
	//IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input; // 配置PA2、3、4、5、6为输入

    APHCON = 0b00100011; // 设置2、3、4、6、7上拉
    //APHCON = 0b10100011; // 设置2、3、4、6上拉
	PCON = 0xc8; // 设置5上拉

    //配置PB按钮
	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output | C_PB4_Output; // 配置PB为输出低电平
	set_PB_low();
	PORTBbits.PB4 = 0;
}

void led_open(void)
{
    for(unsigned char i = 0; i < 200; i++)
    {
        PORTBbits.PB4 = 1;
        delay_us(1);
        PORTBbits.PB4 = 0;
        delay_us(27);
    }
}

unsigned char Check_Keydown()
{
    unsigned char KeyValue=0;
    unsigned char sCodeValue = 0;
    unsigned char KeyStatus = 0;

    KeyStatus = PORTA;
    KeyStatus = KeyStatus & 0xfc; // 0x7c

    if(KeyStatus != 0xfc) // 0x7c
    {
        delay_ms(5);
        KeyStatus = PORTA;
        KeyStatus = KeyStatus & 0xfc;

        if(KeyStatus != 0xfc)
        {
            if(!PORTAbits.PA6)
            {
                KeyValue=0x11;
            }
            if(!PORTAbits.PA7)
            {
             KeyValue=0x12;
            }

            KeyStatus = KeyStatus & 0x3c;

            switch(KeyStatus)
            {

                case(0X38): KeyValue=0x01;break;
                case(0X34): KeyValue=0x02;break;
                case(0X2C): KeyValue=0x03;break;
                case(0X1C): KeyValue=0x04;break;
            }

            APHCON = 0b00111111; // 2、3、4上拉取消
            PCON = 0xe8; // 5上拉取消
            IOSTA = 0b11000000; // 配置PA2、3、4、5为输出低电平
            set_PA_low();

            IOSTB = 0b00001111; // 配置PB0、1、2、3为输入
            BPHCON = 0xF0; // 0、1、2、3上拉

			if(0b00000111 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue;
			}
			else if(0b00001011 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x04;
			}
			else if(0b00001101 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x08;
			}
			else if(0b00001110 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x0c;
			}
        }
        else
        {
            return 1;
        }

        key_init();

        sCodeValue = KeyValue - 0x01;

   		while(0xfc != (PORTA & 0xfc)) // 0x7c
		{
			// 等待，准备下一次发送
			// 发送数据包
			send_ble_packet(sCodeValue);
            // led
			led_open();
			PORTBbits.PB4 = 0;
			delay_ms(20);
			led_open();
			PORTBbits.PB4 = 0;
			delay_ms(20);
			key_init();
		}
        return 0;
    }
    return 1;
}