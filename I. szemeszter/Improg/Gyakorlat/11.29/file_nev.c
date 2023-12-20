#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX_STRING 20

int main() {

	char T[MAX_STRING];

	printf("String: ");
	printf("%d\n",sizeof(int));
	fgets(T, MAX_STRING, stdin);

	int l = strlen(T);
	/*
	char T2[l]; !!!ilyet nem csinalunk!!
	*/
	char *T2 = malloc (sizeof(char)*l);
	strcpy(T2, T);
	printf("T2: %s\n", T2);

	free(T2);
	return 0;
}