#include <stdio.h>
#include <stdlib.h>

#define FILENAME "test.txt"
int main()
{
  FILE *fp = NULL;
  long length = 0;
  long pos = 0;

  fp = fopen(FILENAME, "r");
  if (fp == NULL)
  {
    printf("Failed to open file");
    exit(-1);
  }
  fseek(fp, 0, SEEK_END);
  length = ftell(fp);
  while (pos < length)
  {
    pos++;
    fseek(fp, -pos, SEEK_END);
    printf("%c", fgetc(fp));
  };

  fclose(fp);
  fp = NULL;

  printf("\n");
  getchar();
  return 0;
}