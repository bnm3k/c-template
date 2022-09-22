.DEFAULT_GOAL:=all
SHELL=/bin/bash

BUILD_DIR:=./build
OBJS_DIR:=$(BUILD_DIR)/objs

MAIN:=$(BUILD_DIR)/a.out

SRCS:=$(wildcard src/*c)
DEPS:=$(wildcard include/*.h)
OBJS:=$(patsubst %.c,$(OBJS_DIR)/%.o,$(SRCS))

CC=gcc
LD=gcc
CFLAGS=-I./include/ -O -Wextra -Wall -Wpedantic -Werror -g
LDFLAGS=
LIBS=

$(OBJS_DIR)/%.o: %.c $(DEPS)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(MAIN): $(OBJS)
	$(LD) -o $@ $^ $(LIBS) $(LDFLAGS)

all: $(MAIN)

run: $(MAIN)
	cat tests/data/lines.txt | $(MAIN)

clean:
	git clean -fxd

format:
	find ./src -type f \( -name '*.c' -o -name '*.h' \)  -exec clang-format -i {} +

.PHONY: clean format run build
