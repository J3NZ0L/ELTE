#include <stdio.h>

int maxertek (int* tomb; int meret);

int main(){
    int T[]={1, 4, -2, 5, 3};
    int maxertek=T[0];
    for (int i=0; i<(int)(sizeof(T)/sizeof(T[0]));i++){
        if (maxertek<T[i]){
            maxertek=T[i];
        }
    }
    printf("%d\n",maxertek);
}