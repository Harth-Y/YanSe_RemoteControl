#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"
#include "app_tx.h"
#include "bsp_usart.h"

#define UPDATE_REG(x)  __asm__("MOVR _" #x ",F")
// volatile unsigned char SLEEP_STATUS = 1;

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
	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input; //| C_PA7_Input;  // 配置PA2、3、4、5、6为输入
	APHCON = 0b10100011; // 设置2、3、4、6上拉
	PCON = 0xc8; // 设置5上拉

    //配置PB按钮
	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output | C_PB4_Output; // 配置PB为输出低电平
	set_PB_low();
	PORTBbits.PB4 = 0;
}

unsigned char Check_Keydown()
{

    //usart_send_string("[KEY] in CHECK KEY\r\n");
    unsigned char KeyValue=0;
    unsigned char sCodeValue = 0;
    unsigned char KeyStatus = 0;

    KeyStatus = PORTA;
    KeyStatus = KeyStatus & 0x7c;

    if(KeyStatus != 0x7c)
    {
        delay_ms(10);
        KeyStatus = PORTA;
        KeyStatus = KeyStatus & 0x7c;

        if(KeyStatus != 0x7c)
        {
			// SLEEP_STATUS = 0;
            usart_send_string("[KEY] key down\r\n");
            if(!PORTAbits.PA6)
            {
               // usart_send_string("[KEY] key.PA6 down\r\n");
                KeyValue=0x11;
            }

            // if(!PORTAbits.PA7)
            // {
            //  KeyValue=0x12;
            // }



            KeyStatus = KeyStatus & 0x3c;
			// if(KeyStatus == 0x38)
			// {
			// 	usart_send_string("[KEY] KeyStatus == 0x38\r\n");
			// }
            switch(KeyStatus)
            {

                case(0X38): KeyValue=0x01;
							//usart_send_string("[KEY] A0111\r\n");
							break;
                case(0X34): KeyValue=0x02;
							//usart_send_string("[KEY] A1011\r\n");
							break;
                case(0X2C): KeyValue=0x03;
							//usart_send_string("[KEY] A1101\r\n");
							break;
                case(0X1C): KeyValue=0x04;
							//usart_send_string("[KEY] A1110\r\n");
							break;
            }

            APHCON = 0b10111111; // 2、3、4上拉取消
            PCON = 0xe8; // 5上拉取消
            IOSTA = 0b01000000; // 配置PA2、3、4、5为输出低电平
            set_PA_low();

            IOSTB = 0b00001111; // 配置PB0、1、2、3为输入
            BPHCON = 0xF0; // 0、1、2、3上拉

			if(0b00000111 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue;
				// usart_send_string("[KEY] B0111\r\n");
			}
			else if(0b00001011 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x04;
				// usart_send_string("[KEY] B1011\r\n");
			}
			else if(0b00001101 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x08;
				//usart_send_string("[KEY] B1101\r\n");
			}
			else if(0b00001110 == (PORTB & 0x0f))
			{
				KeyValue=KeyValue+0x0c;
				//usart_send_string("[KEY] B1110\r\n");
			}
        }
        else
        {
            return 0;
        }

        key_init();

        sCodeValue = KeyValue - 0x01;
		uint8_t i = 0;

        while(1)     // 等待按键释放
        {
            // 等待，准备下一次发送
            // led
            PORTBbits.PB4 = 1;
            delay_ms(100);
            PORTBbits.PB4 = 0;
            delay_ms(100);
            // 发送数据包
            send_ble_packet(sCodeValue);
			//i++;
			key_init();

			if(PORTAbits.PA6 && PORTAbits.PA5 && PORTAbits.PA4 && PORTAbits.PA3 && PORTAbits.PA2)

            {
				//i = 0;
                usart_send_string("[KEY] key up\r\n");
				// SLEEP_STATUS = 1;
                return 0;
            }
			PORTBbits.PB4 = 1;
            delay_ms(100);
            PORTBbits.PB4 = 0;
            delay_ms(100);
        }
    }
    return 0;
}