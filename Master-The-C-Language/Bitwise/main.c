#include <stdio.h>
int main()
{
  unsigned int a = 60; // 0011 1100
  unsigned int b = 13; // 0000 1101
                       // ---------
  int c = a & b;       // 0000 1100 

  int d = a | b;       // 0011 1101

  int e = a ^ b;       // 0011 0001

  printf("result c: %d", c);
  printf("result c: %d", c);
  // Temp work around till I get a better way to get console to wait
  int i;
  printf("\nEnter any number to exit...");
  scanf("%d", &i);
  return 0;
}