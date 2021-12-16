#include <stdio.h>
#include "stringfunctions.h"

void main()
{
  char str1[] = "This is my test sentence: #$$& @#$*)(";
  char str2[] = "Joel Watson";

  printf("# of s's in str: %d\n", frequency(str1, 's'));
  rmNonAlphabet(str1);
  printf("str1 with the non alphabet chars removed: %s\n", str1);
  printf("the length of str2 is: %d\n", calcLength(str2));
  combine(str1, str2);
  printf("the combine strings are %s\n", str1);
  char str2Copy[calcLength(str2) + 1];
  copy(str2, str2Copy);
  printf("A copy of str2 looks like this: %s\n", str2Copy);
  char sub[5];
  substr(str2, 0, 4, sub);
  printf("The first 4 letters of str2: %s", sub);
}

// Compile with headers from static lib
// gcc -I ../static_lib/headers -c main.c -o main.o

// Compile objects together
// gcc -o main main.o ../static_lib/lib_static_lib.a