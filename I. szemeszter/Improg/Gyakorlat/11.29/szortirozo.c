#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int* szortirozo(int* T, int size);


int main(){
int T[]={1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int*A=szortirozo(T,10);
for (int i=0;i<10;i++){
    printf("%d ", A[i]);
}

}

int* szortirozo(int* T, int size){
    int* A = malloc(sizeof(int)* size);
    int from=0, to=size-1;
    for (int i=0; i<size; i++){
        if (T[i]%2==0){
            A[from] = T[i];
            from++;
        } else {
            A[to]=T[i];
            to--;
        }
    }
    return A;
}