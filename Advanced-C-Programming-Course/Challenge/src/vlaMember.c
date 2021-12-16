#include <stdio.h>
#include <stdlib.h>

struct a
{
  int length;
  int array[];
};

int vlaMember()
{
  int length;
  struct a *ptr = NULL;

  printf("Enter the length of your array\n");
  scanf("%d", &length);

  ptr = malloc(sizeof(struct a) + length * sizeof(int));
  ptr->length = length;

  for (int i = 0; i < length; i++)
  {
    ptr->array[i] = 1 + i;
  }

  printf("\n Array Length: %d. Array Contents: [%d", length, ptr->array[0]);

  for (int i = 1; i < length; i++)
  {
    printf(", %d", ptr->array[i]);
  }
  free(ptr);
  printf("]\n\nEnter to close program...");
  getchar();
  return 0;
}