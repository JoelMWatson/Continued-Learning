#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

int main()
{
  int num = 50;
  int *nptr = &num;

  printf("Value of the num int variable : num = %d\n",num);
  printf("Address of num variable: (void*) &num = %p\n",(void*) &num);
  printf("Address of the Pointer: (void*) &nptr = %p\n",(void*) &nptr);
  printf("Value of the nptr Pointer var: nptr = %p\n",nptr);
  printf("Value nptr pointer var Points to: *nptr = %d\n",*nptr);

  return 0;
}