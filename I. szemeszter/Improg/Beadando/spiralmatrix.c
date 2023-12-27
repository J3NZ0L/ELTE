#include "menu.h"
#include "matrix_generator.h"
#include "matrix_printer.h"
#include "matrix_saver.h"
#include "matrix_importer.h"

int main(){
    int** actual_matrix=NULL;
    char file_name[13];
    int dim;
    bool rotation; //cw
    int direction; //f
    print_menu_header(); //Elso menu kiiratas

    int choice; // Elso valasztas bekerese
    scanf("%d",&choice);
    fociklus(&choice,actual_matrix,&dim,&rotation,&direction, file_name);

    return 0;
}

void fociklus(int* Choice, int** Matrix,int* dimension, bool* rotation, int* direction, char* file_name){
    printf("\n"); 
    while (*Choice<0 || *Choice>5){
            printf("\nWrong menu point, please provide another choice: ");
            scanf(" %d",Choice);
        }
    while(*Choice!=5){
        switch (*Choice){
        case 0:
            print_user_guide();
            break;
        case 1:
            free_matrix(&Matrix,*dimension);
            get_dimension(dimension);
            get_direction(direction);
            get_rotation(rotation);
            generate_matrix(&Matrix,*dimension,*direction,*rotation);
            break;
        case 2:
            print_matrix(Matrix,*dimension);
            break;
        case 3:
            if (Matrix!=NULL){
            save_matrix(Matrix,*dimension,*direction,*rotation);
            } else {
                printf("There is no current matrix to be saved. Please generate or import one!\n");
            }
            break;
        case 4:
            get_filename(file_name);
            printf("filename: %s", file_name);
            if (_access(file_name, 0) == -1) {
                printf("File doesn't exist.\n");
            } else {
                free_matrix(&Matrix,*dimension);
                printf("Provide the attributes of the matrix being imported: ");
                get_dimension(dimension);
                get_direction(direction);
                get_rotation(rotation);
                import_matrix(&Matrix,*dimension,file_name);
            }   
            break;
        }
        print_menu_header();
        scanf(" %d",Choice);
    }  
    free_matrix(&Matrix,*dimension);
}

void print_menu_header(){ // ,/
    printf("\n    |#################################|\n    |#### Spiral Matrix Generator ####|\n    |#################################|\n\n       /0/ : User guide\n       /1/ : Generate a matrix\n       /2/ : Print matrix to terminal\n       /3/ : Save matrix\n       /4/ : Import matrix from file\n       /5/ : Quit the program\n\nChoice: ");

}

void print_matrix(int** Matrix, int N){  //,/
    int actual_num;
    for (int i=0; i<N; i++){
        for (int j=0; j<N; j++){
            actual_num=Matrix[i][j];
            if (actual_num<10){
                printf("   %d",actual_num);
            } else if (actual_num<100){
                printf("  %d",actual_num);
            } else{
                printf(" %d",actual_num);
            }
        }
        printf("\n");
    }
}

void print_user_guide(){ // ,/
    printf("        /0/ : User guide: Short description of the program.\n       /1/ : Generate a matrix: The user should give 3 parameters when asked: the dimension of the matrix (N:[1..20]), the starting direction\n        (D:['balra','fel','jobbbra','le']), and the direction of rotation (R:['cw','ccw']).    \n       /2/ : Print matrix to terminal : Prints the matrix onto the standard output (which is by standard the terminal). \n       /3/ : Save matrix : Saves the matrix into a text file. The name indicates the attributes of the matrix, like this: \"spiralNDR.txt, where N is the dimension of the matrix,\n          D is the direction of the matrix in the start, and R is the direction of rotation. \n       /4/ : Import matrix from file : Imports a matrix from file. This procedure clears the previous matrix from the memory. \n       /5/ : Quit the program : Choose this to exit. \n\n");
}

void generate_matrix(int*** Matrix, int N, int D, bool R){ // ,/
    printf("\nGenerating the matrix...\n");
    *Matrix=(int**)malloc(N*sizeof(int *));
    for (int i=0; i<N; i++){
        (*Matrix)[i]=(int*)malloc(N*sizeof(int));
    }
   int actual_num=1;
   int actual_num_of_increases=1;
   int block_increases=2;
   int block_increases_left=2;
   int increases_left=1;
   int i,j;
   int actual_dir=D;
   if (N%2==1){
        i=(int)(N-1)/2;
        j=(int)(N-1)/2;
   } else {
        if (R==0){
            
            switch (D){                
                case 0: 
                    i=N/2;
                    j=N/2-1;
                    break;
                case 1: 
                    i=N/2-1;
                    j=N/2-1;
                    break;
                case 2: 
                    i=N/2-1;
                    j=N/2;
                    break;
                case 3: 
                    i=N/2;
                    j=N/2;
                    break;
            }
        } else {
            
            switch (D){
                case 0: 
                    i=N/2;
                    j=N/2;
                    break;
                case 1: 
                    i=N/2;
                    j=N/2-1;
                    break;
                case 2: 
                    i=N/2-1;
                    j=N/2-1;
                    break;
                case 3: 
                    i=N/2-1;
                    j=N/2;
                    break;
            }
        }
   }
    while (actual_num<=N*N){
        //printf("n: %d d: %d\n ",actual_num,actual_dir);
        //printf("i: %d j: %d\n\n,", i, j);
        (*Matrix)[i][j]=actual_num;
        switch (actual_dir){
            case 0: i-=1; break;
            case 1: j+=1; break;
            case 2: i+=1; break;
            case 3: j-=1; break;
        }
        actual_num++;
        increases_left-=1;
        if (increases_left>0){ 
        } else {
            block_increases_left-=1;
            if (block_increases_left>0){
                increases_left=actual_num_of_increases;
                if (R==0){
                    actual_dir=(actual_dir+1)%4;
                } else {
                    actual_dir=abs((actual_dir+4-1)%4);
                }
            } else{
            actual_num_of_increases+=1;
            increases_left=actual_num_of_increases;
            block_increases_left=block_increases;
            if (R==0){
                    actual_dir=(actual_dir+1)%4;
                } else {
                    actual_dir=(actual_dir+4-1)%4;
                }
            }
        }   
        //printf("\ni_l: %d a_i_l: %d b_i_l: %d\n",increases_left, actual_num_of_increases, block_increases_left);
    }
    printf("Done!\n\n");
}

void get_dimension(int* dim){ // ,/
    int N;
    printf("N: ");
    scanf(" %d",&N);
    while (N<0 || N>20){
            printf("\nWrong number for dimension, please provide another number: ");
            scanf(" %d",&N);
        }
    *dim=N;
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
            printf("\nWrong input(%s) for rotation, please provide another one: ", sR);
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

void save_matrix(int** Matrix,int dimension, int direction,bool rotation){ // ,/ 
    char* sdim;
    int fs=6; // filename size, kezdetben size("spiral")
    if (dimension<10){
    sdim=(char*)malloc(sizeof(char));
    fs+=1;
    } else{
    sdim=(char*)malloc(2*sizeof(char));
    fs+=2;
    };
    char* sdir;
    sdir=(char*)malloc(sizeof(char));
    char* srot;
    if (rotation){ //cw
    srot=(char*)malloc(2*sizeof(char));
    } else{
    srot=(char*)malloc(3*sizeof(char));
    }
    sprintf(sdim,"%d",dimension);
    char cdir;
    switch (direction){
        case 0: cdir='f';
        break;
        case 1: cdir='j';
        break;
        case 2: cdir='l';
        break;
        case 3: cdir='b';
        break;
    }
    fs+=1;
    sprintf(sdir,"%c",cdir);
    if (rotation){
        sprintf(srot,"%s","cw");
        fs+=2;
    } else{
        sprintf(srot,"%s","ccw");
        fs+=3;
    }
    char* file_name=(char*)malloc(fs*sizeof(char));
    strcpy(file_name,"spiral");
    strcat(file_name,sdim);
    strcat(file_name,sdir);
    strcat(file_name,srot);
    strcat(file_name,".txt");
    
    FILE*  f = fopen(file_name, "w");
    int actual_num;
    for (int i=0; i<dimension; i++){
        for (int j=0; j<dimension; j++){
            actual_num=Matrix[i][j];
            if (actual_num<10){
                fprintf(f,"   %d",actual_num);
            } else if (actual_num<100){
                fprintf(f,"  %d",actual_num);
            } else{
                fprintf(f," %d",actual_num);
            }
        }
        fprintf(f,"\n");
    }   
    fclose(f);
}

void get_filename(char file_name[13]){
    //file_name=(char*)malloc(13*sizeof(char));
    printf("Please provide a file name: ");
    scanf(" %s",file_name);
   // printf("filename: \"%s\"",file_name);
    printf("\n");
}

int import_matrix(int*** Matrix,int dimension, char* file_name){
        FILE*  f = fopen(file_name, "r");
        free(&(*Matrix));
        *Matrix=(int**)malloc((dimension)*sizeof(int *));
        for (int i=0; i<dimension; i++){
            (*Matrix)[i]=(int*)malloc((dimension)*sizeof(int));
        }
        int actual_num;
        for (int i=0; i<dimension; i++){
            for (int j=0; j<dimension; j++){
                fscanf(f," %d", &actual_num);
                (*Matrix)[i][j]=actual_num;
            }
            fgetc(f);
        }   
        
        fclose(f);
    free(file_name);
    return 0;
}