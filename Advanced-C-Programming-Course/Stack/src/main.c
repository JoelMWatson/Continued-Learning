#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

int main()
{
  StackPtr top = NULL;
  int choice = 0;
  int item = 0;

  while (choice != 3)
  {
    choice = 0;
    printf("Enter your choice\n"
           "1 Push to stack.\n"
           "2 Pull from stack.\n"
           "3 End.\n"
           "> ");
    scanf("%d", &choice);

    switch (choice)
    {
    case 1:
      printStack(top);
      printf("Enter a int to push to the stack\n> ");
      scanf("%d", &item);
      push(&top, item);
      printStack(top);
      break;
    case 2:
      printStack(top);
      printf("Popping int from the stack: %d\n", pop(&top));
      printStack(top);
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
