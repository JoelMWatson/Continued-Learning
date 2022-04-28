#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <string.h>
#include <errno.h>
#include <signal.h>

void challenge1();
void challenge2();
int catch_signal(int sig, void (*handler)(int));
void error(char *msg);
void end_game();
void times_up();

int score = 0;

// main method
int main()
{
  // Signals Challenge
  challenge1();

  // Fork challenge (process clone)
  //challenge2();
  return 0;
}

void challenge1()
{
  printf("\nChallenge 1\n");
  srand(time(0));

  catch_signal(SIGALRM, times_up);
  catch_signal(SIGINT, end_game);

  while (1)
  {
    int a = rand() % 11;
    int b = rand() % 11;

    char txt[4];

    alarm(5);
    printf("\nWhat is %d times %d: ", a, b);
    fgets(txt, 4, stdin);

    int answer = atoi(txt);

    if (answer == a * b)
      score++;
    else
      printf("\nWrong! Score: %d\n", score);
  }
}

void challenge2()
{
  printf("\nChallenge 2\n");

  pid_t process1 = fork();

  pid_t process2 = fork();

  if (process1 > 0 && process2 > 0)
  {
    printf("Parent: %d %d. ", process1, process2);
    printf("My id: %d. My parents id: %d\n", getpid(), getppid());
  }
  else if (process1 == 0 && process2 > 0)
  {
    printf("Child1: %d %d. ", process1, process2);
    printf("My id: %d. My parents id: %d\n", getpid(), getppid());
  }
  else if (process1 > 0 && process2 == 0)
  {
    printf("Child2: %d %d. ", process1, process2);
    printf("My id: %d. My parents id: %d\n", getpid(), getppid());
  }
  else
  {
    printf("Child3: %d %d. ", process1, process2);
    printf("My id: %d. My parents id: %d\n", getpid(), getppid());
  }
}

int catch_signal(int sig, void (*handler)(int))
{
  struct sigaction action;
  action.sa_handler = handler;
  sigemptyset(&action.sa_mask);
  action.sa_flags = 0;

  return sigaction(sig, &action, NULL);
}

void end_game()
{
  printf("\nFinal score: %d\n", score);
  exit(0);
}

void error(char *msg)
{
  fprintf(stderr, "%s: %s\n", msg, strerror(errno));
  exit(1);
}

void times_up()
{
  puts("\nTime's Up!");
  raise(SIGINT);
}
