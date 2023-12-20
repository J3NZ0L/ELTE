#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
    char* buffer=malloc(123 * sizeof(char));
    char** T;

    char numbuff[10];
    int num;
    /*
    printf("Szavak szama: ");
    fgets(numbuff, 10, stdin);
    num=atoi(numbuff);
    */
    int size = 1;
    T = malloc(num*sizeof(char*));

    for (int i=0; i<num; i++){
        if (!strcmp(buffer, "end\n")){
            break;
        }
        if (i==size){
            size = size* 2> num? num : size*2;
            T =realloc(T, sizeof(char*)*size);
        }
        printf("%d. szo: ", i+1);
        fgets(buffer, 128, stdin);
        //getline(&T[i], &capacity, stdin);
        int l= strlen(buffer);
        T[i] = malloc (l * sizeof(char));
        strcpy(T[i], buffer);

    }
    for (int i=num-1; i>=0; i--){
            printf("%d. szo: %s", i+1, T[i]);
    }
    
    for (int i=0; i<num; i++){
        free(T[i]);
    }
    free(buffer);
    return 0;
}

//valgrind --leak-check=full .\file.c