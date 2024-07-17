#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"
#include "app_tx.h"

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
	IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output | C_PA6_Input | C_PA7_Input;
	APHCON = 0xc0;
	set_PA_low();

    // 配置PB按钮
	IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input | C_PB4_Output;
	BPHCON = 0x30;
	// led
	PORTBbits.PB4 = 0;

}

unsigned char Check_Keydown()
{
	unsigned char KeyValue=0;
    unsigned char sCodeValue = 0;
	unsigned char KeyStatus = 0;

	KeyStatus = PORTB;
	KeyStatus = KeyStatus & 0x0F;
	if(KeyStatus != 0x0f || !PORTAbits.PA6 || !PORTAbits.PA7)
	{
		delay_ms(10);
		KeyStatus = PORTB;
        KeyStatus = KeyStatus & 0x0F;
		if(KeyStatus != 0x0f || !PORTAbits.PA6 || !PORTAbits.PA7)
		{
			CLRWDT();
			SLEEP_STATUS = 0;
			switch(KeyStatus)
			{
				case(0X0e):	KeyValue=0x01;break;
				case(0X0d):	KeyValue=0x02;break;
				case(0X0b): KeyValue=0x03;break;
				case(0X07):	KeyValue=0x04;break;
			}
			BPHCON = 0x3F;
			IOSTB = C_PB0_Output | C_PB1_Output | C_PB2_Output | C_PB3_Output;
			set_PB_low();
			IOSTA = C_PA2_Input | C_PA3_Input | C_PA4_Input | C_PA5_Input;
			APHCON = 0xc3;
			KeyStatus = PORTA;
            KeyStatus = KeyStatus & 0x3C;
			switch(KeyStatus)
			{
				case(0X38):	KeyValue=KeyValue;break;
				case(0X34):	KeyValue=KeyValue+0x04;break;
				case(0X2C): KeyValue=KeyValue+0x08;break;
				case(0X1C):	KeyValue=KeyValue+0x0c;break;
			}


			if(!PORTAbits.PA6)
			{
				KeyValue = 0x11;
			}
			if(!PORTAbits.PA7)
			{
				KeyValue = 0x12;
			}
		}
		else
		{
			return 0;
		}
		APHCON = 0xff;
		IOSTA = C_PA2_Output | C_PA3_Output | C_PA4_Output | C_PA5_Output;
		set_PA_low();
		IOSTB = C_PB0_Input | C_PB1_Input | C_PB2_Input | C_PB3_Input;
		BPHCON = 0x30;
        sCodeValue = KeyValue - 0x01;


		KeyStatus = PORTB;
		KeyStatus = KeyStatus & 0x0F;
        while(KeyStatus != 0x0F)     // 等待按键释放
        {
			CLRWDT();
			KeyStatus = PORTB;
			KeyStatus = KeyStatus & 0x0F;
            // 发送数据包
            send_ble_packet(sCodeValue);
			SLEEP_STATUS = 1;
            return KeyValue;
        }
	}
	return 0;
}



