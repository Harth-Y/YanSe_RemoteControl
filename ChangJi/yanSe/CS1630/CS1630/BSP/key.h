#ifndef KEY_H
#define KEY_H

extern volatile unsigned char SLEEP_STATUS;

void key_init(void);
void set_PA_low(void);
void set_PB_low(void);
void led_open(void);
void led(void);
unsigned char Check_Keydown(void);

#endif
