#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct item
{
  char *name;
  int quantity;
  float price;
  float amount;
};

void readItem(struct item *item);

void printItem(struct item *item);

int main()
{
  struct item itm, *pitm;
  pitm = &itm;

  // allocate memory for the string
  pitm->name = (char *)malloc(30 * sizeof(char));

  // exit if memory allocation failed
  if (pitm == NULL)
    exit(-1);

  readItem(pitm);
  printItem(pitm);

  // free the allocated memory to avoid a leak
  free(pitm->name);
  return 0;
}

void readItem(struct item *item)
{
  printf("Please enter item name:\n");
  scanf("%s", item->name);

  printf("Please enter item quantity:\n");
  scanf("%d", &item->quantity);

  printf("Please enter item price:\n");
  scanf("%f", &item->price);

  item->amount = (float)item->price * item->quantity;
}

void printItem(struct item *item)
{
  printf("=======================\n");
  printf("Item:\n");
  printf("-----------------------\n");
  printf("Name: %s\n", item->name);
  printf("Quantity: %d\n", item->quantity);
  printf("Price: $%.2f\n", item->price);
  printf("Total Amount: $%.2f\n", item->amount);
  printf("========================\n");
}