#include <stdio.h>
#include "main.h"

int main()
{
  fun();
  return 0;
}
// Step1
//  gcc -I ../dynamic_lib/ -c main.c -o main.o

// Step2
// gcc -o main.exe main.o -L../dynamic_lib -llib_mylib

// Step3
// Windows
// export PATH=<--Path to lib-->:$PATH
// Linux/Mac
// export LD_LIBRARY_PATH==<--Path to lib-->:$LD_LIBRARY_PATH