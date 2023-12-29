#include "menu.h"
#include "matrix_generator.h"
#include "matrix_printer.h"
#include "matrix_saver.h"
#include "matrix_importer.h"

void get_dimension(int* dim){ // valamiert tesz egy \n-t choice utan es dimbeker elott, amugy kiraly
    char input[100];
    int num;
    printf("N: ");
    char c; //karakter a bentmaradt \n-ek elfogyasztasahoz
    while ((c = getchar()) != '\n' && c != EOF);
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';
    while (sscanf(input, " %d", &num) != 1 || strspn(input, "0123456789") != strlen(input) || num < 1 || num > 20 ){
        printf("\nWrong number for dimension, please provide another number: ");
        fgets(input, sizeof(input), stdin);
        input[strcspn(input, "\n")] = '\0';
    }
    *dim=num;
}

void get_direction(int* dir){ // ,/
    char cD;
    printf("Direction: ");
    scanf(" %c",&cD);
    while (cD!='j' && cD!='l' && cD!='f' && cD!='b'){
            printf("\nWrong character as direction, please provide another character: ");
            scanf(" %c",&cD);
        }
    switch (cD){
        case 'f': *dir=0; break;
        case 'j': *dir=1; break;
        case 'b': *dir=3; break;
        case 'l': *dir=2; break;
    }
}
void get_rotation(bool* rot){ // ,/
    char sR[4];
    printf("Rotation: ");
    scanf(" %s",sR);
    while (strcmp(sR,"cw")!=0 && strcmp(sR,"ccw")!=0){
            printf("\nWrong input for rotation, please provide another one: ");
            scanf(" %s",sR);
        }
    if (strcmp(sR,"cw")==0){
        *rot=0;
    } else {
        *rot=1;
    }
}

void free_matrix(int ***matrix, int N){ // ,/
    for (int i = 0; i < N; i++) {
            free((*matrix)[i]);
        }
    free(*matrix);
}

void get_filename(char** file_name){ // ,/
    *file_name=(char*)malloc(14*sizeof(char));
    printf("Please provide a file name: ");
    scanf(" %s",*file_name);
    printf("\n");
}

char* itostr(int num){ // ,/
    char* str = (char*)malloc(sizeof(char) * 3);
    if (num < 10) {
        str[0] = num + '0';
        str[1] = '\0';
    } else if (num < 20) {
        str[0] = '1';
        str[1] = num % 10 + '0';
        str[2] = '\0';
    } else if (num == 20) {
        str[0] = '2';
        str[1] = '0';
        str[2] = '\0';
    };
    return str;
}