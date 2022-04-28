#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "queue.h"

void enqueue(QueuePtr *front, int value)
{
  QueuePtr new_node = malloc(sizeof(node_t));
  if (new_node != NULL)
  {
    new_node->data = value;
    new_node->nxtptr = NULL;
    QueuePtr current = *front;
    if (*front != NULL)
    {
      while (current->nxtptr != NULL)
      {
        current = current->nxtptr;
      }
      current->nxtptr = new_node;
    }
    else
    {
      *front = new_node;
    }
  }
}

int dequeue(QueuePtr *front)
{
  int removed = -1;
  if (isEmpty(front) == 0)
  {
    removed = (*front)->data;
    *front = (*front)->nxtptr;
  }
  return removed;
}

int isEmpty(QueuePtr *front)
{
  return (*front == NULL) ? 1 : 0;
}

void printQueue(QueuePtr front)
{
  QueuePtr current = front;
  while (current != NULL)
  {
    printf("%d --> ", current->data);
    current = current->nxtptr;
  }
  printf("NULL\n");
}
