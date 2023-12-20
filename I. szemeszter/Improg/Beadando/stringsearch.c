#include <stdio.h>
#include <string.h>

int main() {
    char str[] = "Hello, World!";
    char *substring = "World";

    char *found = strstr(str, "olah");
    if (found) {
        printf("%s\n",found);
        int start = found - str;
        int end = start + strlen(substring) - 1;

        printf("Substring found starting at position %d and ending at position %d.\n", start, end);
    } else if (found!=NULL) {
        printf("Substring not found.\n");
    }

    return 0;
}