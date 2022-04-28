#include <stdio.h>
#include <string.h>

int calcLength(char *str)
{
  int length = 0;
  if (str == NULL)
    return length;
  while (str[length] != '\0')
    length++;
  return length;
}

int frequency(char *str, char c)
{
  int count = 0;
  for (int i = 0; str[i] != '\0'; i++)
  {
    if (str[i] == c)
      count++;
  }
  return count;
}

int rmNonAlphabet(char *str)
{
  int i = 0, j = 0;

  for (i = 0; str[i] != '\0'; ++i)
  {
    while (!((str[i] >= 'a' && str[i] <= 'z') || (str[i] >= 'A' && str[i] <= 'Z') || str[i] == '\0'))
    {
      for (j = i; str[j] != '\0'; ++j)
      {
        str[j] = str[j + 1];
      }
      str[j] = '\0';
    }
  }

  return 0;
}

int combine(char *str1, char *str2)
{
  int length1 = calcLength(str1);
  int length2 = calcLength(str2);
  int i = 0, j = 0;
  for (i = 0; str1[i] != '\0'; i++)
  {
  }

  for (j = 0; str2[j] != '\0'; j++, i++)
  {
    str1[i] = str2[j];
  }
  str1[i] = '\0';
  return 0;
}

int copy(char *src, char *dst)
{
  for (int i = 0; src[i] != '\0'; i++)
  {
    dst[i] = src[i];
  }
  return 0;
}

int substr(char *src, int from, int end, char *target)
{
  for (int i = 0; i < end - from; i++)
  {
    target[i] = src[from + i];
  }
  return 0;
}

// Step1: Generate the object file for our lib
// gcc -c stringfunctions.c -o lib_stringfunctions.o

// Step2: Create the static library (archive file) from the object files
// ar rcs lib_stringfunctions.a lib_stringfunctions.o

// Step3: Check what object files are in the archive
// ar -t lib_stringfunctions.a