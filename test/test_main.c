#include "unity/unity.h"
#include <stdio.h>

void setUp(void) {
    // This is run before EACH TEST
}

void tearDown(void) {}

int main(void) {
    UNITY_BEGIN();
    printf("Run tests\n");
    return UNITY_END();
}
