#include <stdio.h>

int main() {
	/*
	int j;
	int* p;
	p=&j;
	*p=10;
	printf("%d\n",p);
	*/

	/*
	int t[10];
	int* p = t; //p a t tomb elso elemere mutat, mivel intre mutat, nem tombre a tipusa
	int arr[] = {1, 2, 3};
	// arr = {1, 2, 4}; // Forditasi hiba!, nince ertekado muvelet
	int* ptr = arr; // ugyanaz mint alatta, mukodik ez is
	int* q = &arr[0]; //ugyanaz mint folotte
	arr[1] = 5;
	ptr[1] = 5; //igazabol lefordul, de nem ugyanaz mint folotte
	//p[1] == *(p+1)
	*/

	/*
	int t[] = {3, 2, 1};
	ptr = t; // ok
	arr = t; // forditasi hiba
	printf("%d %d\n", sizeoff(arr), sizeoff(ptr));


	int t[] = {6, 2, 8, 7, 3);
	int* p = NULL;

	for (int i =  0 ; i< 5; ++i) 	
		if (t[i] %2 ==1)
		p= &t[i];
	*/

	//printf("Elso paratlan szam:
	/*	
	char str[] = "hello";
	char* p=str;
	char* q =str;
	while (*q != '\0')
		q++
	q-p==strlen(str);
	*/

	//==strlen("hello");
	/*
	int t[10];
	int* p[10] = t;

	int f(int x) 
	{
		return 2*x;
	}
	*/
	
	/*
	int sum(int* t[]) // int t[] helyett!!
	{
		int s = 0;
		for (int i=0;i< sizeof(t) / sizeof(t[0]); ++i)
			s+=t[i];
		return s;
	}

	int t[] = {1, 2, 3, 4, 5};
	*/
	
	/*
	 void f(char* t)
	 {
	 
	 }

	f("hello");
	char c ='x';
	char * p =&c; //altalaban egy string elso elemere mutat

	p="hello";
	/*
	int main(int argc, char** argv)
	{
	for (int i =0; i< argc;++i)
		printf("&s\n", argc[i]);
	}
	*
	return 0;
}
