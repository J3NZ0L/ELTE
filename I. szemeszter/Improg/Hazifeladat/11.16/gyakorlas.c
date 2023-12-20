#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int main(){
    char tomb[2][4];
    for (int i=0; i<4; i++){
        for (int j=0; j<2; j++){
            tomb[i][j]='4';
        }
        printf("\n");
    }
    for (int i=0; i<4; i++){
        for (int j=0; j<2; j++){
            printf("%c",tomb[i][j]);
        }
        printf("\n");
    }
}