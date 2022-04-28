#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
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

  FILE *fp, *newp = NULL;
  char c;
  // rename
  // remove

  fp = fopen("test.txt", "r+");
  newp = fopen("temp.txt", "w");
  if (fp == NULL)
  {
    perror("Failed to open file.");
    exit(-1);
  }
  do
  {
    c = fgetc(fp);
    if (islower(c) != 0)
      c -= 32;
    fputc(c, newp);
  } while (c != EOF);

  fclose(fp);
  fclose(newp);

  rename("temp.txt", "test.txt");

  getchar();
  return 0;
}