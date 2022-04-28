#include <stdio.h>
#include <stdlib.h>
#include "binarytree.h"

int main()
{
  TreeNodePtr root = NULL;
  int nodes[7] = {20, 30, 10, 40, 0, 25, 15};

  for (int i = 0; i < 7; i++)
  {
    printf("Inserting: %d\n", nodes[i]);
    insert(&root, nodes[i]);
  }

  printf("Preordered:\n");
  printPreeorder(&root);
  printf("\n\n");
  printf("Inordered:\n");
  printInorder(&root);
  printf("\n\n");
  printf("Postordered:\n");
  PrintPostorder(&root);

  return 0;
}
