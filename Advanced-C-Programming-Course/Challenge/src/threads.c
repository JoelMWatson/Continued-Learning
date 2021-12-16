#include <stdio.h>
#include <pthread.h>

#define NTHREADS 10

void challenge1();
void *handler(void *msg);

pthread_cond_t evens_done = PTHREAD_COND_INITIALIZER;
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t cond_lock = PTHREAD_MUTEX_INITIALIZER;

int counter = 0;
int evens_finished = 0;

int main()
{
  challenge1();
  return 0;
}

void challenge1()
{
  pthread_t threads[NTHREADS];
  int values[NTHREADS];

  for (int i = 0; i < NTHREADS; i++)
  {
    values[i] = i;
    // Thread Creation
    pthread_create(&threads[i], NULL, handler, &values[i]);
  }

  // sleep to let all the jobs start and the odds start waiting
  sleep(1);

  while (1)
  {
    if (evens_finished == NTHREADS / 2)
    {
      // Wake all the threads up waiting for evens_done
      // with a signal broadcast
      pthread_cond_broadcast(&evens_done);
    }
  }

  for (int j = 0; j < NTHREADS; j++)
  {
    // Thread Join back to main thread
    pthread_join(threads[j], NULL);
    // Exit Thread (commented out when running over and over)
    pthread_exit(&threads[j]);
  }
  counter = 0;
  evens_finished = 0;
}

void *handler(void *msg)
{
  int *x = (int *)msg;
  pthread_mutex_lock(&cond_lock);

  if (*x % 2 == 0)
  {
    evens_finished++;
  }
  else
  {
    pthread_cond_wait(&evens_done, &lock);
  }
  pthread_mutex_unlock(&cond_lock);

  pthread_mutex_lock(&lock);
  counter++;
  printf("Message is: %d. Thread ID: %lu, Changed Counter: %d\n", *x, pthread_self(), counter);
  printf("Message is: %d. Thread ID: %lu, Counter Unchanged: %d\n", *x, pthread_self(), counter);
  pthread_mutex_unlock(&lock);
  return NULL;
}
