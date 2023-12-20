#include <stdio.h>
#include <math.h>

int sum(int n){
    return n*(n+1)/2;
}

void elso_10_hatvany(int n){
    for (int i=0; i<=10; i++){
        printf("\n",(int)pow(n,i));
    }
}


int main(){
    int szam;
    scanf("%d",&szam);
    //printf("%d\n",sum(szam));
   // elso_10_hatvany(2);

    //swap:
    //itoa és atoi fgvk 
    
    char T[10];
    itoa (szam, T, 10);
    printf("after itoa: %s\n",T);
    
    char * first=T;
    char *last=T;
    while (*(last+1)!='\0'){
        last++;
    }
    char last_c=*last;
    *last=*first;
    *first=last_c;
    atoi(T);
    printf("%d",atoi(T));
    return 0;
}