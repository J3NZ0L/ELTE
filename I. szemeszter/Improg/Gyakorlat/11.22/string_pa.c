#include <stdio.h>

int main(){
	char S1[] = "Hello";
	char* S2 = "Greetings";
	// char temporary_string[] = "Greetings";
	// char* S2 = temporary_string;
	
	S1[0] = 'Y';
	//S2[0] = 'T';
	
	printf("%s\n", S1);
	printf("%s\n", S2);
	
	return 0;
}