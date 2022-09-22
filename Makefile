.DEFAULT_GOAL:=all
SHELL=/bin/bash

BUILD_DIR:=./build
OBJS_DIR:=$(BUILD_DIR)/objs
MAIN:=$(BUILD_DIR)/a.out

SRCS:=$(wildcard src/*.c)
INCLUDE=$(wildcard include/*.h)
OBJS:=$(patsubst %.c,$(OBJS_DIR)/%.o,$(SRCS))

CC=gcc
LD=gcc
CFLAGS:=-I./include/ -O -Wextra -Wall -Wpedantic
ifdef DEBUG
	CFLAGS+=-g
else # Release
	CFLAGS+=-Werror
endif
LDFLAGS=
LIBS=

.SECONDEXPANSION:
$(OBJS_DIR)/%.o: %.c $$(INCLUDE)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(MAIN): $(OBJS)
	$(LD) -o $@ $^ $(LIBS) $(LDFLAGS)

all: $(MAIN)

run: $(MAIN)
	cat test/data/lines.txt | $(MAIN)

TEST_SRCS:=$(shell find test/ -type f -name *.c)
TEST_OBJS:=$(patsubst %.c,$(OBJS_DIR)/%.o,$(TEST_SRCS))
TEST_MAIN:=$(BUILD_DIR)/test.out
$(TEST_MAIN): $(TEST_OBJS)
	$(LD) -o $@ $^

test: INCLUDE+=$(wildcard test/*.h)
test: $(TEST_MAIN)
	@./$(TEST_MAIN)

clean:
	git clean -fxd

format:
	find ./src -type f \( -name '*.c' -o -name '*.h' \)  -exec clang-format -i {} +

.PHONY: clean format run build test
