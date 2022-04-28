#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#define PREDEFINED_MACROS()       \
  printf("Line: %d\n", __LINE__); \
  printf("File: %s\n", __FILE__); \
  printf("Date: %s\n", __DATE__); \
  printf("Time: %s\n", __TIME__); \
  printf("Standard C: %d\n", __STDC__);

#define SUM(a, b) (a + b)

#define SQUARE(a) (a * a)
#define CUBE(a) (a * a * a)

#define IS_UPPER(a) (a > 64 && a < 91)
#define IS_LOWER(a) (a > 96 && a < 123)

int main()
{
  // Challenge 1
  PREDEFINED_MACROS();

  // Challenge 2
  printf("Sum of 5 and 27 is: %d\n", SUM(5, 27));

  // Challenge 3
  printf("5 squared is: %d\n", SQUARE(5));
  printf("5 cuved is: %d\n", CUBE(5));

  // Challenge 4
  _Bool upper = IS_UPPER('A');
  _Bool lower = IS_LOWER('a');

  printf("Uppercase: %d\n", upper);
  printf("Lowercase: %d\n", lower);

  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}