#include <stdio.h>
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#define switches (volatile char*) 0x00011020
#define leds (char *) 0x00011030
void main(){
	while(1){
		*leds = *switches;
		printf("leds : %x", *leds);
		printf("switches : %x", *switches);
		printf("\n");
	}
}
