#include <stdio.h>
#include <stdlib.h>

struct bit_fields
{
  unsigned int : 6;
  unsigned int opaque : 1;
  unsigned int border : 1;
  unsigned int f_color : 3;
  unsigned int b_color : 3;
  unsigned int b_style : 2;
};

void readPacked(struct bit_fields packed);

int main()
{
  struct bit_fields packed = {1, 1, 3, 4, 0};

  readPacked(packed);

  packed.opaque = 0;
  packed.border = 0;
  packed.f_color = 2;
  packed.b_color = 2;
  packed.b_style = 2;

  readPacked(packed);

  printf("\n\nEnter to close program...");
  getchar();
  return 0;
}

void readPacked(struct bit_fields packed)
{
  // opacity
  switch (packed.opaque)
  {
  case 0:
    printf("\nTransparent\n");
    break;
  case 1:
    printf("Opaque\n");
    break;
  }

  // border
  switch (packed.border)
  {
  case 0:
    printf("Border hidden\n");
    break;
  case 1:
    printf("Border Shown\n");
    break;
  }

  // fill
  switch (packed.f_color)
  {
  case 0:
    printf("Fill color is black\n");
    break;
  case 1:
    printf("Fill color is white\n");
    break;
  case 2:
    printf("Fill color is red\n");
    break;
  case 3:
    printf("Fill color is blue\n");
    break;
  case 4:
    printf("Fill color is green\n");
    break;
  case 5:
    printf("Fill color is yellow\n");
    break;
  case 6:
    printf("Fill color is orange\n");
    break;
  }

  // border color
  switch (packed.b_color)
  {
  case 0:
    printf("Border color is black\n");
    break;
  case 1:
    printf("Border color is white\n");
    break;
  case 2:
    printf("Border color is red\n");
    break;
  case 3:
    printf("Border color is blue\n");
    break;
  case 4:
    printf("Border color is green\n");
    break;
  case 5:
    printf("Border color is yellow\n");
    break;
  case 6:
    printf("Border color is orange\n");
    break;
  }
  // border style
  switch (packed.b_style)
  {
  case 0:
    printf("Border style is solid\n");
    break;
  case 1:
    printf("Border style is dashed\n");
    break;
  case 2:
    printf("Border style is dotted\n");
    break;
  }
}