#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int random(int also, int felso){
    return rand()%(felso-also)+also;
}

int main(){
    srand(time(NULL));
    
    int N=random(1,50);
    int M=random(1,50);
    FILE * f  =fopen("teszt6.txt","w");
    fprintf(f, "%d", N);
    fprintf(f, "%c",' ');
    fprintf(f,"%d",M);
    fprintf(f,"%c",'\n');

    int num;
    for (int i=0; i<N; i++){
        for (int j=0; j<M; j++){
            num=random(-50,50);
            fprintf(f,"%d",num);
            fprintf(f,"%c",' ');
        }
        fprintf(f,"%c",'\n');
    }
    fclose(f);
}