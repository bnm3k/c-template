#include "../include/str_helpers.h"

// strindex: return the start of pattern or -1 if pattern in string not
// found
int str_index(char source[], char pattern[]) {
    int i, j, k;
    for (i = 0; source[i] != '\0'; ++i) {
        for (j = i, k = 0; pattern[k] != '\0' && source[j] == pattern[k];
             j++, k++)
            ;
        if (k > 0 && pattern[k] == '\0') return i;
    }
    return -1;
}

int str_index_rightmost(char s[], char t[]) {
    int s_i        = 0;
    int right_most = -1;
    for (s_i = 0; s[s_i] != '\0'; ++s_i) {
        int t_i  = 0;
        int ss_i = s_i;
        for (; t[t_i] != '\0' && t[t_i] == s[ss_i]; ++t_i, ++ss_i)
            ;
        if (t[t_i] == '\0' && t_i > 0) right_most = s_i;
    }
    return right_most;
}
