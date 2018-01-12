#include <stdio.h>
//Currency conversion calculator. Takes in information from the user and returns
//a converted amount. Since we are using floats to keep hold of our variables, there
//are bounds on the amounts that you can calculate. The largest amount however, is
//3.40282 * 10^38, which is well above all of the money in the world, so going over
//the limit should not be a concern.
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
