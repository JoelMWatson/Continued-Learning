#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <math.h>

double variardic_function(int count, ...);
int variardic_sum_function(int count, ...);

int main()
{
  int sum1 = variardic_sum_function(4, 10, 11, 12, 13);
  printf("Sum is %d\n", sum1);

  int sum2 = variardic_sum_function(2, 10, 11);
  printf("Sum is %d\n", sum2);

  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}

int variardic_sum_function(int count, ...)
{
  int sum = 0.0;

  va_list args;
  va_start(args, count);

  for (int i = 0; i < count; i++)
  {
    sum += va_arg(args, int);
  }

  va_end(args);
  return sum;
}

double variardic_function(int count, ...)
{
  // create varialbles for args
  va_list args;
  va_list args_copy;

  // put given params in args
  va_start(args, count);
  va_copy(args, args_copy);

  // Process args
  double arg1 = va_arg(args, double);

  // End args
  va_end(args);

  // have ref to modified args or unmodified args_copy

  return 0.0;
}
