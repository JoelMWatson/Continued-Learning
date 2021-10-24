#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdbool.h>

int main()
{
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