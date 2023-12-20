#include <stdio.h>

int szamjegyekszorzata(int num){
    char T[10];
    itoa(num,T,10);
    int i=0;
    int p=1;
    while (T[i]!='\0'){
        p*=atoi(T[i]);
        i++;
    } 
    return p;

}

int main(){
    int N;
    scanf("%d",&N);
    printf("Szamjegyek szorzata: %d",szamjegyekszorzata(N));
}