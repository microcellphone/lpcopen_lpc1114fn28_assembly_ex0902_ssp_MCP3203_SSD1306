/*
===============================================================================
 Name        : lpcopen_lpc1114fn28_asm_ex09_ssp_MCP3202.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/

#if defined (__USE_LPCOPEN)
#if defined(NO_BOARD_LIB)
#include "chip.h"
#else
#include "board.h"
#endif
#endif

#include <cr_section_macros.h>

// TODO: insert other include files here
#include <my_ssp.h>
#include "xprintf.h"
#include "mcp3202.h"
#include "oled.h"


// TODO: insert other definitions and declarations here
#define CH0 0
#define CH1 1

extern void Delay (unsigned long tick);
extern void USART_putc(char data);

int main(void) {

#if defined (__USE_LPCOPEN)
    // Read clock settings and update SystemCoreClock variable
    SystemCoreClockUpdate();
#if !defined(NO_BOARD_LIB)
    // Set up and initialize all required blocks and
    // functions related to the board hardware
    Board_Init();
    // Set the LED to the state of "On"
    Board_LED_Set(0, true);
#endif
#endif

    // TODO: insert code here
	  int cnt = 0;
	  uint16_t adc_Val0 = 0;
	  float adc_vol0;
	  uint16_t adc_Val1 = 0;
	  float adc_vol1;
	  uint8_t y = 0;

	  SysTick_Config(SystemCoreClock/1000 - 1); /* Generate interrupt each 1 s   */

	  MCP3202_Config_Request();
	  CS_Init();
	  OLED_Config_Request();
	  xdev_out(OLED_PutChar);

    // Force the counter to be placed into memory
    volatile static int i = 0 ;
    // Enter an infinite loop, just incrementing a counter
    while(1) {
        Delay(1000);
        MCP3202_Config_Request();
        adc_Val0 = MCP3202_Read_Reg(CH0);
        adc_vol0 = 3.3*adc_Val0/4095;
        adc_Val1 = MCP3202_Read_Reg(CH1);
        adc_vol1 = 3.3*adc_Val1/4095;

//        OLED_Config_Request();
        ssd1306_Fill(Black);

        OLED_SetCursor(2, y);
        xprintf("Cnt-> %d", cnt);
        y += 18;
        OLED_SetCursor(2, y);
        xprintf("Val0=%d", adc_Val0);
        y += 18;
        OLED_SetCursor(2, y);
        xprintf("Val1=%d", adc_Val1);
        ssd1306_RefreshScreen();

        y = 0;
        cnt++;
        i++ ;
        // "Dummy" NOP to allow source level single
        // stepping of tight while() loop
        __asm volatile ("nop");
    }

    return 0 ;
}
