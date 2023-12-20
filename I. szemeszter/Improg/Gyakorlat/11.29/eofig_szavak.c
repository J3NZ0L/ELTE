#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
    char* buffer=malloc(128 * sizeof(char));
    char** T;

    /*
    printf("Szavak szama: ");
    fgets(numbuff, 10, stdin);
    num=atoi(numbuff);
    */
    int size = 1;
    T = malloc(size*sizeof(char*));

    for (int j=0; j<=size; j++){
        printf("%d. szo: ", j+1);
        if (fgets(buffer, 128, stdin)==NULL){
            break;
        }
        if (!strcmp(buffer, "end\n")){
            break;
        }
        if (j==size){
            size = size* 2> size? size : size*2;
            T =realloc(T, sizeof(char*)*size);
        }
        printf("%d. szo: ", j+1);
        fgets(buffer, 128, stdin);
        int l= strlen(buffer);
        T[j] = malloc (l * sizeof(char));
        strcpy(T[size], buffer);

    }
    for (int i=size-1; i>=0; i--){
            printf("%d. szo: %s", i+1, T[i]);
    }
    
    for (int i=0; i<size; i++){
        free(T[i]);
    }
    free(buffer);
    return 0;
}