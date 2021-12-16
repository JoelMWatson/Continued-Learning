#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int socketCreate(void);
int socketConnect(int hSocket);
int socketSend(int hSocket, char *req, short reqlen);
int socketRecieve(int hSocket, char *res, short reslen);

int main(int argc, char const *argv[])
{
  int hSocket = 0, read_size = 0;
  struct sockaddr_in server;
  char from_server[200] = {0};
  char to_server[100] = {0};

  // 1. Create client socket
  hSocket = socketCreate();
  printf("Socket created\n");

  // 2. Connect to server
  int connected = socketConnect(hSocket);
  if (connected < 0)
  {
    printf("Couldnt connect to server\n");
    exit(EXIT_FAILURE);
  }
  printf("Connection successful\n");

  // 3. Input message
  printf("Enter your message: ");
  fgets(to_server, 100, stdin);

  // Send message
  socketSend(hSocket, to_server, strlen(to_server));

  // Recieve reply
  read_size = socketRecieve(hSocket, from_server, 200);
  printf("Reply: %s\n", from_server);

  close(hSocket);
  return 0;
}

int socketCreate(void)
{
  int hSocket;
  printf("Creating the socket\n");
  hSocket = socket(AF_INET, SOCK_STREAM, 0);
  if (hSocket == -1)
  {
    printf("Couldn't created socket\n");
    exit(EXIT_FAILURE);
  }
  return hSocket;
}

int socketConnect(int hSocket)
{
  int iRetVal = -1;
  int ServerPort = 12345;

  struct sockaddr_in remote = {0};
  remote.sin_family = AF_INET;
  remote.sin_port = htons(ServerPort);
  inet_pton(AF_INET, "127.0.0.1", &remote.sin_addr); // server is on localhost

  iRetVal = connect(hSocket, (struct sockaddr *)&remote, sizeof(struct sockaddr_in));
  if (iRetVal < 0)
  {
    printf("Couldn't connect to socket\n");
    exit(EXIT_FAILURE);
  }
  return iRetVal;
}

int socketSend(int hSocket, char *req, short reqlen)
{
  int retVal = -1;
  struct timeval tv;
  tv.tv_sec = 20;
  tv.tv_usec = 0;

  if (setsockopt(hSocket, SOL_SOCKET, SO_SNDTIMEO, (char *)&tv, sizeof(struct timeval)) < 0)
  {
    printf("Timed out");
    return -1;
  }
  retVal = send(hSocket, req, reqlen, 0);
  if (retVal < 0)
  {
    printf("Couldn't send on socket\n");
    exit(EXIT_FAILURE);
  }
  return retVal;
}

int socketRecieve(int hSocket, char *res, short reslen)
{
  int retVal = -1;
  struct timeval tv;
  tv.tv_sec = 20;
  tv.tv_usec = 0;

  if (setsockopt(hSocket, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv, sizeof(struct timeval)) < 0)
  {
    printf("Timed out");
    return -1;
  }
  retVal = recv(hSocket, res, reslen, 0);
  printf("retVal: %s", res);
  if (retVal < 0)
  {
    printf("Couldn't recieve on socket\n");
    exit(EXIT_FAILURE);
  }
  return retVal;
}