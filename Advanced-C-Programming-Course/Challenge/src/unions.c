#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <math.h>

union student
{
  char letterGrade;
  int roundedGrade;
  float exactGrade;
};

int main()
{
  union student grade;

  float r = rand() % 126;
  grade.letterGrade = (char)r;
  printf("Letter: %c\n", grade.letterGrade);
  grade.roundedGrade = (int)r;
  printf("\nRounded: %d\n", grade.roundedGrade);
  grade.exactGrade = r;
  printf("Exact: %f\n", grade.exactGrade);

  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}