#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"
#include "app_tx.h"
#include "bsp_usart.h"

volatile unsigned char SLEEP_STATUS = 1;

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
	IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input | C_PA6_Input; // 配置PA为输入
	APHCON = 0x83; // 设置2、3、4、5、6上拉
	if(PORTAbits.PA5)// 此处应该是上拉才对，但是是低的
	{
		usart_send_string("[KEY] PA5 high\r\n");
	}
	else
	{
		usart_send_string("[KEY] PA5 low\r\n");
	}

    // 配置PB按钮
	IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output | C_PB4_Output; // 配置PB为输出低电平
	set_PB_low();
	PORTBbits.PB4 = 0;
}

unsigned char Check_Keydown()
{
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
			usart_send_string("[KEY] key down\r\n");
			if(!PORTAbits.PA6)
			{
				usart_send_string("[KEY] key.PA6 down\r\n");
				KeyValue=0x11;
			}

			// if(!PORTAbits.PA7)
			// {
			// 	KeyValue=0x12;
			// }
			//SLEEP_STATUS = 0;
			// if(PORTAbits.PA2)
			// {
			// 	usart_send_string("[KEY] PA2 high\r\n");
			// }
			// else
			// {
			// 	usart_send_string("[KEY] PA2 low\r\n");
			// }
			// if(PORTAbits.PA3)
			// {
			// 	usart_send_string("[KEY] PA3 high\r\n");
			// }
			// else
			// {
			// 	usart_send_string("[KEY] PA3 low\r\n");
			// }
			// if(PORTAbits.PA4)
			// {
			// 	usart_send_string("[KEY] PA4 high\r\n");
			// }
			// else
			// {
			// 	usart_send_string("[KEY] PA4 low\r\n");
			// }
			if(PORTAbits.PA5)
			{
				usart_send_string("[KEY] PA5 high\r\n");
			}
			else
			{
				usart_send_string("[KEY] PA5 low\r\n");
			}
			// if(PORTAbits.PA6)
			// {
			// 	usart_send_string("[KEY] PA6 high\r\n");
			// }
			// else
			// {
			// 	usart_send_string("[KEY] PA6 low\r\n");
			// }

			KeyStatus = KeyStatus & 0x3c;
			switch(KeyStatus)
			{
				case(0X38):	KeyValue=0x01;usart_send_string("[KEY] A1110\r\n");break;
				case(0X34):	KeyValue=0x02;usart_send_string("[KEY] A1101\r\n");break;
				case(0X2C): KeyValue=0x03;usart_send_string("[KEY] A1011\r\n");break;
				case(0X1C):	KeyValue=0x04;usart_send_string("[KEY] A0111\r\n");break;
			}

			usart_send_string("[KEY] keyA IN change to keyB IN\r\n");
			APHCON = 0xFF;
			IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output;
			set_PA_low();

			IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input;
			BPHCON = 0xF0;

			KeyStatus = PORTB;
            KeyStatus = KeyStatus & 0x0F;

			if(PORTBbits.PB0)
			{
				usart_send_string("[KEY] PB0 high\r\n");
			}
			else
			{
				usart_send_string("[KEY] PB0 low\r\n");
			}
			if(PORTBbits.PB1)
			{
				usart_send_string("[KEY] PB1 high\r\n");
			}
			else
			{
				usart_send_string("[KEY] PB1 low\r\n");
			}
			if(PORTBbits.PB2)
			{
				usart_send_string("[KEY] PB2 high\r\n");
			}
			else
			{
				usart_send_string("[KEY] PB2 low\r\n");
			}
			if(PORTBbits.PB3)
			{
				usart_send_string("[KEY] PB3 high\r\n");
			}
			else
			{
				usart_send_string("[KEY] PB3 low\r\n");
			}

			switch(KeyStatus)
			{
				usart_send_string("[KEY] in PB switch\r\n");
				case(0X0e):	KeyValue=KeyValue;usart_send_string("[KEY] B1110\r\n");break;
				case(0X0d):	KeyValue=KeyValue+0x04;usart_send_string("[KEY] B1101\r\n");break;
				case(0X0b): KeyValue=KeyValue+0x08;usart_send_string("[KEY] B1011\r\n");break;
				case(0X07):	KeyValue=KeyValue+0x0c;usart_send_string("[KEY] B0111\r\n");break;
				case(0x0f):	usart_send_string("[KEY] B1111\r\n");break;
			}
			usart_send_string("[KEY] out PB switch\r\n");
		}
		else
		{
			return 0;
		}
		usart_send_string("[KEY] keyB IN change to keyA IN\r\n");
		IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input; // 配置PA为输入
		APHCON = 0x83; // 设置2、3、4、5、6上拉
		BPHCON = 0x3f; // 清除所有上拉
		IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output; // 配置PB为输出低电平
		set_PB_low();

        sCodeValue = KeyValue - 0x01;


		KeyStatus = PORTA;
		KeyStatus = KeyStatus & 0x7c;
        while(1)     // 等待按键释放
        {
			usart_send_string("[KEY] in while\r\n");
			usart_send_string("[KEY] while start\r\n");
			// 等待，准备下一次发送
			// led
			PORTBbits.PB4 = 1;
			delay_250ms();
			PORTBbits.PB4 = 0;
			delay_250ms();
			KeyStatus = PORTA;
			KeyStatus = KeyStatus & 0x7c;

			if(KeyStatus != 0x7c)

			{
				usart_send_string("[KEY] in while key down\r\n");
			}
			else
			{
				usart_send_string("[KEY] in while key up\r\n");
				break;
			}
            // 发送数据包
            //send_ble_packet(sCodeValue);
			//SLEEP_STATUS = 1;
			PORTBbits.PB4 = 1;
			delay_250ms();
			PORTBbits.PB4 = 0;
			delay_250ms();
			usart_send_string("[KEY] while end\r\n");
        }
		}
	return 0;
}



