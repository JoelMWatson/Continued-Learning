#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

char board[10] = {'-', '-', '-', '-', '-', '-', '-', '-', '-', '-'};

void checkForWin();
void drawboard();
bool markboard(char player);

int main()
{

  bool player1Turn = true;
  char player1 = 'X';
  char player2 = 'O';

  printf("Tic Tac Toe\n\n");
  printf("Player 1: (X) | Player 2: (O)\n\n");

  while (board[0] == '-')
  {
    drawboard();
    bool played = false;
    if (player1Turn)
    {
      played = markboard(player1);
    }
    else
    {
      played = markboard(player2);
    }
    if (played)
      player1Turn = !player1Turn;

    checkForWin();
  }

  drawboard();
  if (board[0] == 'D')
  {
    printf("The game is was a draw!\n");
  }
  else
  {
    printf("The %c's player wins!", board[0]);
  }

  return 0;
}

void checkForWin()
{
  if ((board[1] == 'X' && board[2] == 'X' && board[3] == 'X') ||
      (board[4] == 'X' && board[5] == 'X' && board[6] == 'X') ||
      (board[7] == 'X' && board[8] == 'X' && board[9] == 'X') ||
      (board[1] == 'X' && board[4] == 'X' && board[7] == 'X') ||
      (board[2] == 'X' && board[5] == 'X' && board[8] == 'X') ||
      (board[3] == 'X' && board[6] == 'X' && board[9] == 'X') ||
      (board[1] == 'X' && board[5] == 'X' && board[9] == 'X') ||
      (board[3] == 'X' && board[5] == 'X' && board[7] == 'X'))
  {
    board[0] = 'X';
  }
  else if (
      (board[1] == 'O' && board[2] == 'O' && board[3] == 'O') ||
      (board[4] == 'O' && board[5] == 'O' && board[6] == 'O') ||
      (board[7] == 'O' && board[8] == 'O' && board[9] == 'O') ||
      (board[1] == 'O' && board[4] == 'O' && board[7] == 'O') ||
      (board[2] == 'O' && board[5] == 'O' && board[8] == 'O') ||
      (board[3] == 'O' && board[6] == 'O' && board[9] == 'O') ||
      (board[1] == 'O' && board[5] == 'O' && board[9] == 'O') ||
      (board[3] == 'O' && board[5] == 'O' && board[7] == 'O'))
  {
    board[0] = 'O';
  }
  else
  {
    int count = 0;
    for (int i = 1; i < 10; i++)
    {
      if (board[i] == '-')
        count++;
    }
    if (count < 1)
      board[0] = 'D';
  }
}
void drawboard()
{
  printf("   |   |   \n");
  printf(" %c | %c | %c \n", board[1], board[2], board[3]);
  printf("   |   |   \n");
  printf("-----------\n");
  printf("   |   |   \n");
  printf(" %c | %c | %c \n", board[4], board[5], board[6]);
  printf("   |   |   \n");
  printf("-----------\n");
  printf("   |   |   \n");
  printf(" %c | %c | %c \n", board[7], board[8], board[9]);
  printf("   |   |   \n\n");
}

bool markboard(char player)
{
  int position = 0;
  printf("Select a position between 1 and 9\n");
  scanf("%d", &position);

  if ((position < 10 && position > 0) && board[position] == '-')
  {
    board[position] = player;
    return true;
  }
  return false;
}