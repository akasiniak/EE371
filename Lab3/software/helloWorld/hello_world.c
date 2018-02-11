/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <stdio.h>
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#define switches (volatile char*) 0x00011020
#define leds (char *) 0x00011030

int main()
{
  char startLoop;
  startOfLoop:
  printf("Hello from Nios II!\n");
  startLoop = getchar();
  if(startLoop == 'G'){
    while(1){
      *leds = *switches;
    }
  }
  goto startOfLoop;

  return 0;
}
