#ifndef QUEUE_H_INCLUDED
#define QUEUE_H_INCLUDED

typedef struct node
{
  int data;
  struct node *nxtptr;
} node_t;

typedef node_t *QueuePtr;

void enqueue(QueuePtr *front, int value);
int dequeue(QueuePtr *front);
int isEmpty(QueuePtr *front);
void printQueue(QueuePtr front);

#endif