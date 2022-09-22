#include "../include/getline.h"
#include "../include/str_helpers.h"

#include <stdio.h>
#define MAXLINE 1000

int main() {
    char line[MAXLINE];
    char pattern[] = "ould";

    while (1) {
        int line_len = my_getline(line, MAXLINE);
        if (line_len > 0) {
            int starts_at = str_index(line, pattern);
            if (starts_at < 0) continue;
            if (line_len >= 2 && line[line_len - 1] == '\n') {
                line[line_len - 1] = '\0';
            }
            printf("\"%s\"\n\tpattern=%s,starts_at=%d\n", line, pattern,
                   starts_at);
        } else {
            break;
        }
    }
    return 0;
}
