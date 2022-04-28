# super simple make file
CC=gcc
CFLAGS = -Wall -g -I ./headers
SRC = $(wildcard src/*.c)

main: $(SRC)
	$(CC) $(CFLAGS) $? -o $@