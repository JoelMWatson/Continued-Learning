#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <string.h>

int socketCreate(void);
int bindCreatedSocket(int hSocket);

int main(int argc, char const *argv[])
{
  int socket_desc = 0, sock = 0, clientLength = 0;
  struct sockaddr_in client;
  char client_message[200] = {'\0'};
  char message[100] = {0};
  const char *pmessage = "Hello from Joel's server";

  // 1. Create server socket
  socket_desc = socketCreate();
  printf("Socket created\n");

  // 2. Bind socket
  bindCreatedSocket(socket_desc);
  printf("Bind successful\n");

  // 3. Listen for connections
  listen(socket_desc, 3); // 3 max length of waiting queue
  printf("Listening...\n");

  while (1)
  {
    printf("Waiting for incomming connections");
    clientLength = sizeof(struct sockaddr_in);

    // 4. accept connection from client
    sock = accept(socket_desc, (struct sockaddr *)&client, (__socklen_t *)&clientLength);
    if (sock < 0)
    {
      perror("Couldn't accept connection\n");
      return 1;
    }

    printf("Connection accepted\n");

    memset(client_message, '\0', sizeof(client_message));
    memset(message, '\0', sizeof(message));

    // 5. Receive reply from client
    if (recv(sock, client_message, 200, 0) < 0)
    {
      printf("Couldn't receive message\n");
      break;
    }
    printf("Client reply: %s\n", client_message);

    // 6. Check client message is what we expect
    //    and set response message accordingly
    (strcmp(pmessage, client_message) == 0) ? strcpy(message, "Hi there!") : strcpy(message, "Invalid message!");

    // 6. Send data
    if (send(sock, message, strlen(message), 0) < 0)
    {
      perror("Send failed");
      return 1;
    }
    close(sock);
    sleep(1);
  }
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

int bindCreatedSocket(int hSocket)
{
  int iRetval = -1;
  int clientPort = 12345;

  struct sockaddr_in remote = {0};

  remote.sin_family = AF_INET;
  remote.sin_addr.s_addr = htonl(INADDR_ANY);
  remote.sin_port = htons(clientPort);

  iRetval = bind(hSocket, (struct sockaddr *)&remote, sizeof(struct sockaddr_in));
  if (iRetval < 0)
  {
    perror("Couldn't bind to socket\n");
    exit(EXIT_FAILURE);
  }
  return iRetval;
}
