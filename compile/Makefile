CC     :=  gcc
CFLAGS := -Wall -Wextra -pedantic -std=c99 -g
LIBS   := -lpthread
RM     := rm -f

.PHONY: all clean

NAME := Parametric
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

all: $(OBJS) $(NAME)

#
# link the .o files into the target executable
#
$(NAME): $(OBJS)
    $(CC) $^ -o $@ $(LIBS)

#
# compile the .c file into .o files using the compiler flags
#
%.o: %.c sleeper.h
    $(CC) $(CFLAGS) -c $< -o $@ -I.


clean:
    $(RM) *.o
    $(RM) bumper_cars