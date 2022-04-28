#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "linkedlist.h"

void insert(ListNodePtr *head, char value)
{
  // alphabetically sorted insert
  ListNodePtr new_node = malloc(sizeof(node_t));
  if (new_node != NULL)
  {
    new_node->data = value;
    new_node->nxtptr = NULL;
    if (*head == NULL)
    {
      *head = new_node;
      return;
    }
    else
    {
      ListNodePtr current = *head;
      ListNodePtr prev = NULL;
      while (current != NULL)
      {
        if (current->data > new_node->data)
        {
          if (prev != NULL)
          {
            prev->nxtptr = new_node;
          }
          new_node->nxtptr = current;
          *head = new_node;
          return;
        }
        prev = current;
        current = current->nxtptr;
      }
      prev->nxtptr = new_node;
    }
  }
}

void insertAtEnd(ListNodePtr *head, char value)
{
  ListNodePtr new_node = malloc(sizeof(node_t));
  if (new_node != NULL)
  {
    new_node->data = value;
    new_node->nxtptr = NULL;
    if (*head != NULL)
    {
      ListNodePtr current = *head;
      while (current->nxtptr != NULL)
      {
        current = current->nxtptr;
      }
      current->nxtptr = new_node;
    }
    else
    {
      *head = new_node;
    }
  }
}

void insertAtBeginning(ListNodePtr *head, char value)
{
  ListNodePtr new_node = malloc(sizeof(node_t));
  if (new_node != NULL)
  {
    new_node->data = value;
    new_node->nxtptr = *head;
    *head = new_node;
  }
}

char deleteFromList(ListNodePtr *head, char value)
{
  char target = '\n';

  if (*head != NULL)
  {
    ListNodePtr curr = *head;
    ListNodePtr prev = NULL;
    while (curr != NULL)
    {
      if (curr->data == value)
      {
        if (prev == NULL)
        {
          *head = NULL;
        }
        else
        {
          prev->nxtptr = curr->nxtptr;
        }
        target = curr->data;
      }
      prev = curr;
      curr = curr->nxtptr;
    }
  }
  return target;
}

void deleteAtBeginning(ListNodePtr *head)
{
  if (*head != NULL)
  {
    *head = (*head)->nxtptr;
  }
}

int isEmpty(ListNodePtr head)
{
  if (head == NULL)
    return 1;
  return 0;
}

void printList(ListNodePtr head)
{
  ListNodePtr current = head;
  while (current != NULL)
  {
    printf("%c --> ", current->data);
    current = current->nxtptr;
  }
  printf("NULL\n");
}
