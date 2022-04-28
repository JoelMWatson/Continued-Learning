#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <malloc.h>

#define DEBUG(fmt, ...) fprintf(stderr, fmt, __VA_ARGS__)

void printvals();
void allocateMemory(int **ptr);

int main()
{
  // Challenge 1
  printvals();

  // Challenge 2
  int *ptr = NULL;
  allocateMemory(&ptr);
  *ptr = 5;
  printf("The number is %d\n", *ptr);
  free(ptr);

  DEBUG("Final Debugging Message %d", 0);
  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}

void printvals()
{
  int num = 3;
  int *ptr = &num;
  int **ptrptr = &ptr;

  printf("Int val:\n");
  printf("num: %d\n", num);
  printf("*ptr: %d\n", *ptr);
  printf("**ptrptr: %d\n", **ptrptr);

  printf("Int address:\n");
  printf("&num: %p\n", &num);
  printf("ptr: %p\n", ptr);
  printf("*ptrptr: %p\n", *ptrptr);

  printf("ptr val:\n");
  printf("*ptr: %d\n", *ptr);
  printf("**ptrptr: %d\n", **ptrptr);

  printf("ptr address:\n");
  printf("*ptr: %p\n", &ptr);
  printf("ptrptr: %p\n", ptrptr);

  printf("ptrptr val & address:\n");
  printf("ptrptr val: %p\n", ptrptr);
  printf("ptrptr address: %p\n", &ptrptr);
}

void allocateMemory(int **ptr)
{
  *ptr = (int *)malloc(5 * sizeof(int));
}
