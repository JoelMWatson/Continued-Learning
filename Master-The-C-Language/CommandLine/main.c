#include <stdio.h>
int main(int argc, char *argv[])
{
  int numofargs = argc;
  char *arg1 = argv[0];
  char *arg2 = argv[1];

  printf("num of args: %d\n", numofargs);
  printf("arg1 is the name: %s\n", argv[0]);
  printf("arg2 is the command line arg: %s\n", argv[1]);

  return 0;
}