#include "getline.h"
#include <stdio.h>

// my_getline: get line into s, return length
int my_getline(char s[], register int lim) {
    int c, i = 0;
    while (--lim > 0 && (c = getchar()) != EOF && c != '\n') {
        s[i++] = c;
    }
    if (c == '\n') s[i++] = c;
    s[i] = '\0';
    return i;
}
