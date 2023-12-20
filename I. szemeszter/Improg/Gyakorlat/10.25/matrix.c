#include <stdio.h>
//Keszitsunk alprogramot amely a parametereben kapott n*m-es matrixot

void fill_the_matrix(int s, int T[10][10]);

int main(){
    int T[10][10];
    fill_the_matrix(10,T);
    for (int i = 0; i<10; i++){
       for (int j = 0; j<10; j++){
            printf("%d x %d = %d\n", i+1, j+1, T[i][j]);
        }
    } 

    return 0;
}


void fill_the_matrix(int s, int T[10][10]){
    for (int i = 0; i<s; i++){
       for (int j = 0; j<s; j++){
            T[i][j]=(i+1)*(j+1);
        }
    } 
}
