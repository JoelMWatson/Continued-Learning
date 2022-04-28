#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define LENGTH 50

void challenge1();
void challenge2();
void challenge3();
void challenge4();
void fillarray(int arr[], int n);
void showarray(int arr[], int n);
int compare(const void *p1, const void *p2);

// main method
int main()
{
  srand(time(0));
  challenge1();
  challenge2();
  challenge3();
  challenge4();
  return 0;
}

void challenge1()
{
  printf("\nChallenge 1\n");

  printf("50 random numbers between 0.5 and -0.5\n");
  for (int i = 0; i < LENGTH; i++)
  {
    float val = (rand() % 5 + 1) / 10.0;
    int neg = rand() % 2;
    if (neg == 0)
      val *= -1;
    printf("%d. %.1f\n", i + 1, val);
  }
}

void fillarray(int arr[], int n)
{
  for (int i = 0; i < n; i++)
  {
    arr[i] = rand() % 100;
  }
}

void showarray(int arr[], int n)
{
  for (int i = 0; i < n; i++)
  {
    printf("%d | ", arr[i]);
  }
  printf("\n\n");
}

int compare(const void *p1, const void *p2)
{
  return *(int *)p1 - *(int *)p2;
}

void challenge2()
{
  printf("\nChallenge 2\n");
  int arr[LENGTH] = {};
  fillarray(arr, LENGTH);
  showarray(arr, LENGTH);
  qsort(arr, LENGTH, sizeof(int), compare);
  showarray(arr, LENGTH);
}

void challenge3()
{
  time_t epoch = 0;

  time(&epoch);

  if (epoch == 0)
  {
    fprintf(stderr, "Issue finding time.\n");
    exit(1);
  }

  char *local = ctime(&epoch);
  printf("\nChallenge 3\n");
  printf("The current time is %s\n", local);
}

void challenge4()
{
  double seconds = 0;
  time_t epoch = 0;
  time_t start = 0;
  struct tm *current;
  time(&epoch);

  if (epoch == 0)
  {
    fprintf(stderr, "Issue finding time.\n");
    exit(1);
  }

  current = localtime(&epoch);
  current->tm_sec = 0;
  current->tm_hour = 0;
  current->tm_mday = 0;
  start = mktime(current);

  seconds = difftime(epoch, start);
  printf("\nChallenge 4\n");
  printf("It has been %.0f seconds since the start of the month.\n", seconds);
}