CC = gcc
CFLAGS = -Wall

SRC_DIRS = . ./system ./ui web_server

SRCS = $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))
OBJS = $(SRCS:.c=.o)

INC_DIRS = $(foreach dir, $(SRC_DIRS), -I $(dir))

TARGET_NAME = toy
TARGET_PATH = ./bin
TARGET = $(addprefix $(TARGET_PATH)/, $(TARGET_NAME))

%.o: %.c
	$(CC) $(CFLAGS) $(INC_DIRS) -c $< -o $@

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INC_DIRS) -o $@ $(OBJS)


.PHONY: clean
clean:
	rm -rf $(TARGET) $(OBJS)
