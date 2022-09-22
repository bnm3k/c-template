.SILENT:
.DEFAULT_GOAL:=build

BUILD_DIR:=./build
BIN:=$(BUILD_DIR)/a.out

CC=gcc
CFLAGS=-I./include/

$(BIN): src/main.c src/getline.c src/str_helpers.c
	@echo "build $(BIN)"
	$(CC) $(CFLAGS) $^ -o $(BIN)

build: $(BIN)

run: build
	cat tests/data/lines.txt | $(BIN)

clean:
	git clean -fxd

format:
	find ./src -type f \( -name '*.c' -o -name '*.h' \)  -exec clang-format -i {} +

.PHONY: clean format run build
