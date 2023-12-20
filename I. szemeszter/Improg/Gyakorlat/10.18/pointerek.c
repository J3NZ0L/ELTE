#include <stdio.h>

/*
int n=10;
int* p=&n
p=n-nek a memoriaterulete
& : memoriaterulet lekero operator
* : derefferalo operator, visszaadja a pointer altal mutatott helyen levo erteket
*/

int sum(int t[], int size) {
    int s=0;
    for(int i=0; i<size; i++) {
        s+=t[i];
    }
    return s;
}

int sum_p(int* t, int size) {
    int s=0;
    for(int i=0; i<size; i++) {
        s+=t[i];
    }
    return s;
}

int sum_p2(int t[], int size) {
    int s=0;
    for(int i=0; i<size; i++) {
        s+=*(t+i);
    }
    return s;
}

int sum_p3(int *from, int* to) {
    int s=0;
    while(from!=to) {
        s+=*from;
        from++;
    }
    return s;
}

int avg(int *from, int* to) {
    int s=0;
    int length=to-from;
    while(from!=to) {
        s+=*from;
        from++;
    }
    return (float)s/length;
}

int main() {
    /*
    int n = 10;
    int * p = &n;
    printf("n: %d\n&n: %d\np: %d\n*p: %d\n", n, &n, p, *p);
    */

    //p= &n
    //*p = n
    //*p= 20;
    //printf("");    

    //változtasd meg a mutató értékét egy mutatóra mutató mutatóval
    /* 
    int n=10;
    int m = 7;
    int * pn= &n;
    int * pm= &m;

    int ** p = &pn;

    printf("%d\n",**p);
    */
    //pn =&n
    //pm = &m
    //p*

    //pn ne m-r ehanem m-re mutasson, p-n keresztul oldjuk meg
    /*
    *p=&m;
    **p=20;

    printf("n= %d\nm=%d\n&n= %d\n&m= %d\npn= %d\npm=%d\n*pn=%d\n*pm=%d\n&pn= %d\n&pm= %d\np= %d\n&p= %d\n*p=%d\n**p%d\n",n,m,&n,&m,pn,pm,*pn,*pm,&pn,&pm,p,*p,**p);
    */

   int T[] = {10,8,6,7,9,17};
   printf("szamok osszege: %d\n",sum(T,6));
    printf("szamok osszege: %d\n",sum_p3(T,T+6));
    return 0;
}