#include <stdio.h>
int main(void) {
  float conversionRate, dollarAmount, convertedAmount;
  int conversionDirection;
  printf("What is your conversion rate (from dollars to local)?");
  printf("\n");
  scanf("%f", &conversionRate);
  printf("Which direction are you converting?");
  printf("\n");
  printf("(l for local -> dollars, d for dollars -> local)");
  printf("\n");
  scanf("%d", &conversionDirection);
  printf("\n");
  printf("How much cash on hand do you have?");
  printf("\n");
  scanf("%f", &dollarAmount);
  if(conversionDirection == 'd') {
      convertedAmount = dollarAmount * conversionRate;
  } else {
      convertedAmount = dollarAmount * (1/conversionRate);
  }
  printf("Your converted amount: %.2f", convertedAmount);
  printf("\n");
  return 0;
}
