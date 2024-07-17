#include "bsp_delay.h"
#include <ny8.h>
#include "NY8_constant.h"

void delay_ms(unsigned char count)
{
	unsigned char i;
	unsigned char j;
	for(i = 0; i < count; i++)
	{
		for(j = 0; j < 254; j++)
		NOP();
	}
}
void delay_250ms(void)
{
    delay_ms(155);
    delay_ms(124);
}

void delay_us(unsigned char nus)
{
	unsigned char i;
	for(i=1;i<=nus;i++)
	NOP(); // 3.5239us
}

void delay_40us(void)
{
	delay_us(6);
}

