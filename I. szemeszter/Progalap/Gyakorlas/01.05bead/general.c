#include <stdio.h>

int main(){
    FILE* f=fopen("bemenet.txt","w");
    for (int i=0; i<1000; i++){
        fprintf(f,"%d",10);
        fprintf(f,"%c",' ');
    }
    fclose(f);
    return 0;
}