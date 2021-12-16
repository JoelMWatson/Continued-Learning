#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

int main()
{
  QueuePtr front = NULL;
  int choice = 0;
  int item = 0;

  while (choice != 3)
  {
    choice = 0;
    printf("Enter your choice\n"
           "1 Enqueue to queue.\n"
           "2 Dequeue from queue.\n"
           "3 End.\n"
           "> ");
    scanf("%d", &choice);

    switch (choice)
    {
    case 1:
      printQueue(front);
      printf("Enter a int to enqueue\n> ");
      scanf("%d", &item);
      enqueue(&front, item);
      printQueue(front);
      break;
    case 2:
      printQueue(front);
      printf("Dequeued int: %d\n", dequeue(&front));
      printQueue(front);
      break;
    case 3:
      printf("Good bye...\n> ");
      break;
    default:
      printf("Invalid input.\n");
      break;
    }
  }
  return 0;
}
