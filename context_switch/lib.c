#include "lib.h"


void uart_init(void)
{
	UART_CLOCK = 104; // Set UART clock rate
}

void lib_putc(char c)
{
	if (c == '\n')
		lib_putc('\r');
	UART = c;
}

void lib_puts(const char *p)
{
	
	while (*p)
		lib_putc(*(p++));
}