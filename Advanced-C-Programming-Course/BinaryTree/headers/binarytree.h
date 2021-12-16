#ifndef BINARYTREE_H_INCLUDED
#define BINARYTREE_H_INCLUDED

typedef struct node
{
  int data;
  struct node *left;
  struct node *right;
} treeNode;

typedef treeNode *TreeNodePtr;

void insert(TreeNodePtr *root, int value);
void printPreeorder(TreeNodePtr *root);
void printInorder(TreeNodePtr *root);
void PrintPostorder(TreeNodePtr *root);

#endif