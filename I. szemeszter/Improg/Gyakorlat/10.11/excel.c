#include <stdio.h>
#include <math.h>

int char_num(char c){
    return (int)c-64;
}

int main() {
    char oszlop[]="ABC"; //1*26^2+2*2^1+3*26^0
    int sum=0;
    int l=0;
    while (oszlop[l]!='\0'){
        l++;
    }
    printf("%d\n",l);
    for (int i=0; i<l;i++){
        sum+=(int)pow(26,l-i-1)*char_num(oszlop[i]);
    }

    printf("%d\n",sum);
    return 0;
}