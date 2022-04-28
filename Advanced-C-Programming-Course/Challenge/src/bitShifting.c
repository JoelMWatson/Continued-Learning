#include <stdio.h>
#include <stdlib.h>

long long tobinary(int dno);
int checkNthBit(int number, int n);
int setNthBit(int number, int n);

int main()
{
  int numChoice, nChoice;

  printf("Please enter a number:\n");
  scanf("%d", &numChoice);

  printf("Enter nth bit to check and set (0-31):\n");
  scanf("%d", &nChoice);

  printf("The bit at position %d is a %d\n", nChoice, checkNthBit(numChoice, nChoice));
  printf("The number is %d\n", numChoice);
  printf("After setting the bit at position %d to 1, the number is %d\n", nChoice, setNthBit(numChoice, nChoice));

  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}

int checkNthBit(int number, int n)
{
  return (number >> n) & 1;
}

int setNthBit(int number, int n)
{
  return (1 << n) | number;
}

long long tobinary(int dno)
{
  long long bno = 0, rem, f = 1;
  while (dno != 0)
  {
    rem = dno % 2;
    bno = bno + rem * f;
    f = f * 10;
    dno = dno / 2;
  }
  return bno;
}