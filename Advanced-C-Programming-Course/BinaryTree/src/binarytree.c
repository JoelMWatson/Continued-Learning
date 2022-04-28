#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "binarytree.h"

void insert(TreeNodePtr *root, int value)
{
  if (*root == NULL)
  {
    TreeNodePtr new_node = malloc(sizeof(treeNode));
    new_node->data = value;
    new_node->left = NULL;
    new_node->right = NULL;
    *root = new_node;
  }
  else if ((*root)->data > value)
  {
    insert(&(*root)->left, value);
  }
  else
  {
    insert(&(*root)->right, value);
  }
}

void printPreeorder(TreeNodePtr *root)
{
  printf("%d  ", (*root)->data);
  if ((*root)->left != NULL)
    printPreeorder(&(*root)->left);
  if ((*root)->right != NULL)
    printPreeorder(&(*root)->right);
}

void printInorder(TreeNodePtr *root)
{
  if ((*root)->left != NULL)
    printInorder(&(*root)->left);
  printf("%d  ", (*root)->data);
  if ((*root)->right != NULL)
    printInorder(&(*root)->right);
}

void PrintPostorder(TreeNodePtr *root)
{
  if ((*root)->left != NULL)
    PrintPostorder(&(*root)->left);
  if ((*root)->right != NULL)
    PrintPostorder(&(*root)->right);
  printf("%d  ", (*root)->data);
}