#include <stdio.h>
int main(void) {
  float conversionRate, dollarAmount, convertedAmount;
  char conversionDirection;
  printf("What is your conversion rate (from dollars to local)?");
  printf("\n");
  scanf("%f", &conversionRate);
  getchar();
  printf("Which direction are you converting?");
  printf("\n");
  printf("(l for local -> dollars, d for dollars -> local)");
  printf("\n");
  scanf("%c", &conversionDirection);
  getchar();
  printf("How much cash on hand do you have?");
  printf("\n");
  scanf("%f", &dollarAmount);
  getchar();
  if(conversionDirection == 'd') {
      convertedAmount = dollarAmount * conversionRate;
  } else {
      convertedAmount = dollarAmount * (1/conversionRate);
  }
  printf("Your converted amount: %.2f", convertedAmount);
  printf("\n");
  return 0;
}
