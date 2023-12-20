#include <stdio.h>

int main(){
    int T[]={16, 28, 9, 20, 29, 1};
    int W[]={1, 2, 3, 4, 5, 6};
    int sum=0;
    for (int i=0; i<((int)sizeof(T)/sizeof(T[0])); i++){
        for (int j=0; j<((int)sizeof(W)/sizeof(W[0])); j++){
            sum+=T[i]*T[j];    
        }
    }
    printf("%d\n",sum);
}