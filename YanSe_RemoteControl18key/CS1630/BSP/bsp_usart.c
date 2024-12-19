﻿#include "bsp_usart.h"
#include <ny8.h>
#include "NY8_constant.h"
#include "bsp_delay.h"

//delay_us(17); @104us

void usart_init(void)
{
    IOSTA = C_PA7_Output;
    PORTAbits.PA7=1;
}

void usart_send_byte(uint8_t data)
{
    uint8_t i;
    PORTAbits.PA7=0;
    delay_us(17);
    for (i = 0; i < 8; i++)
    {

        if (data & 0x01)
        {
            PORTAbits.PA7=1;
        }
        else
        {
            PORTAbits.PA7=0;
        }
        data >>= 1;
        delay_us(17);
    }
    PORTAbits.PA7=1;
    delay_us(17);
}

void usart_send_string(uint8_t *str)
{
    while (*str)
    {
        usart_send_byte(*str++);
    }
}
