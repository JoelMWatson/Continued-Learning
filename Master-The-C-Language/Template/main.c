#include <stdio.h>
int main()
{
  int i;
  printf("Enter a number!\n");
  scanf("%d", &i);
  printf("\nYou Entered: %d", i);

  // Temp work around till I get a better way to get console to wait
  printf("\nEnter any number to exit...");
  scanf("%d", &i);
  return 0;
}