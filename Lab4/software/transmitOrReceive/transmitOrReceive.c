#include <stdio.h>
#include "sys/alt_stdio.h"
#define characterSent (char *) 0x00011020
#define characterReceived (char *) 0x00011030
#define load (char *) 0x00011040
#define transmitEnable (char *) 0x00011050
#define parallelInput (char *) 0x00011060
#define parallelOutput (char *) 0x00011070

int main(){
		volatile int i;
	while(1){
		*transmitEnable = 1;
		*parallelOutput = alt_getchar();
		*load = 1;
		printf("parallelOutput: %d\n", *parallelOutput);
		printf("characterSent: %d\n", *characterSent);
		printf("characterReceived: %d\n", *characterReceived);
		printf("load: %d\n", *load);
		printf("transmitEnable: %d\n", *transmitEnable);
		*load = 0;
		printf("\n");
		printf("characterSent: %d\n", *characterSent);
		while(!*characterSent){
			continue;
		}
		while ((alt_getchar()) != '\n');
		*transmitEnable = 0;
		printf("characterSent: %d\n", *characterSent);
		printf("characterReceived: %d\n", *characterReceived);
		printf("\n");
		while(!*characterReceived){
			continue;
		}
		printf("characterReceived: %d\n", *characterReceived);
		printf("parallelInput: %d\n", *parallelInput);
		printf("\n");
	}
}
