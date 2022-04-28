#ifndef STACK_H_INCLUDED
#define STACK_H_INCLUDED

typedef struct node
{
  int data;
  struct node *nxtptr;
} node_t;

typedef node_t *StackPtr;

void push(StackPtr *top, int value);
int pop(StackPtr *top);
int isEmpty(StackPtr *top);
void printStack(StackPtr top);

#endif