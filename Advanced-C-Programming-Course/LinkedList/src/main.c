#include <stdio.h>
#include <stdlib.h>
#include "linkedlist.h"

int main()
{
  ListNodePtr head = NULL;
  int choice = 0;
  char item = '\0';

  while (choice != 6)
  {
    choice = 0;
    printf("Enter your choice\n"
           "1 Insert in alphabetical order.\n"
           "2 Insert At End.\n"
           "3 Insert At Beginning.\n"
           "4 Delete from list.\n"
           "5 Delete from beginning of list.\n"
           "6 End.\n"
           "> ");
    scanf("%d", &choice);

    switch (choice)
    {
    case 1:
      printList(head);
      printf("Enter a char to add to the list\n> ");
      scanf("\n%c", &item);
      insert(&head, item);
      printList(head);
      break;
    case 2:
      printList(head);
      printf("Enter a char to add to the end of the list\n> ");
      scanf("\n%c", &item);
      insertAtEnd(&head, item);
      printList(head);
      break;
    case 3:
      printList(head);
      printf("Enter a char to add to the beginning of a list\n> ");
      scanf("\n%c", &item);
      insertAtBeginning(&head, item);
      printList(head);
      break;
    case 4:
      printList(head);
      printf("Enter a char to remove from the list\n> ");
      scanf("\n%c", &item);
      char deleted = deleteFromList(&head, item);
      (deleted == item) ? printf("node removed\n") : printf("node not found\n");
      printList(head);
      break;
    case 5:
      printList(head);
      printf("remove from the beginning of the list\n");
      deleteAtBeginning(&head);
      printList(head);
      break;
    case 6:
      printf("Good bye...\n");
      break;
    default:
      printf("Invalid input.\n");
      break;
    }
  }
  return 0;
}
