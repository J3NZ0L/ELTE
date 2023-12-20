#include <stdio.h>
#include <time.h>

int count_random(int lower, int upper){
    return (rand() % (upper - lower +1)) +lower;
}

void fill_array(int*T, int length){
    srand(time(NULL));
    for (int i=0; i<length; i++){
        T[i]=count_random(1,100);

    }
    for (int i=0; i<length; i++){
        printf("%d ", T[i]);
    }
}

int how_many_greater_than(int *T, int length, int x){
    int s=0;
    for (int i=0; i<length; i++){
        if (T[i]>x){
            s++;
        }
    }
    return s;
}

int main(){
    int T1[9];
    fill_array(T1,9);
    printf("This many: %d",how_many_greater_than(T1,9,50));

}