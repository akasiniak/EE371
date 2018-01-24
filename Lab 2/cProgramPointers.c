/* PART 1 */

/* Declare integers, floats, and chars */
int integer1;
int integer2;
float float1;
float float2;
char char1;
char char2;

/* Declare pointers for integers, floats, and chars */
int* int1Ptr;
int* int2Ptr;
float* floatPtr1;
float* floatPtr2;
char* charPtr1;
char* charPtr2;

/* Assign memory addresses to pointers */
int1Ptr = &integer1;
int2Ptr = &integer2;
floatPtr1 = &float1;
floatPtr2 = &float2;
charPtr1 = &char1;
charPtr2 = &char2;

/* Print out memory addresses */
printf("The value of int1Ptr is: %p\n", (void *) int1Ptr);
printf("The value of int2Ptr is: %p\n", (void *) int2Ptr); 
printf("The value of float1Ptr is: %p\n", (void *) float1Ptr); 
printf("The value of float1Ptr is: %p\n", (void *) float1Ptr); 
printf("The value of char1Ptr is: %p\n", (void *) char1Ptr); 
printf("The value of char1Ptr is: %p\n", (void *) char1Ptr);

/* PART 2 */

/* Declare and assign variables */
int A = 22;
int B = 17;
int C = 6;
int D = 4;
int E = 9;

/* Declare variable */
int result;

/* Delcare pointers */
int* APtr = &A;
int* BPtr = &B;
int* CPtr = &C;
int* DPtr = &D;
int* EPtr = &E;

/* Compute by using dereferencing */
result = ((*APtr-*BPtr)*(*CPtr+*DPtr))/(*EPtr);

/* Print out result */
printf("The value of result is: %f", result);