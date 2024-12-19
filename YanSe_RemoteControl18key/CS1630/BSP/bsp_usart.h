#ifndef __USART_H
#define	__USART_H

#include <stdint.h>
#include <ny8.h>
#include "NY8_constant.h"

// 定义PA2为tx口，波特率为9600

void usart_init(void);
void usart_send_byte(uint8_t data);
void usart_send_string(uint8_t *str);


#endif /* __USART_H */
