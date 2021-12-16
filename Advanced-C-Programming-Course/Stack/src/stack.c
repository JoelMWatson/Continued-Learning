#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "stack.h"

void push(StackPtr *top, int value)
{
  StackPtr temp = malloc(sizeof(node_t));
  temp->data = value;
  temp->nxtptr = *top;
  *top = temp;
}

int pop(StackPtr *top)
{
  int removed = -1;
  if (isEmpty(top) == 0)
  {
    removed = (*top)->data;
    *top = (*top)->nxtptr;
  }
  return removed;
}

int isEmpty(StackPtr *top)
{
  return (*top == NULL) ? 1 : 0;
}

void printStack(StackPtr top)
{
  StackPtr current = top;
  while (current != NULL)
  {
    printf("%d --> ", current->data);
    current = current->nxtptr;
  }
  printf("NULL\n");
}
