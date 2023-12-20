#include <stdio.h>

int sumOfArr(int* arr,int num);

int main(){
    int T[]={1, 2, 3, 4, 5, 6};
    printf("%d\n",sumOfArr(T,6));
}

int sumOfArr(int* arr, int num){
    int sum=0;
    for (int i=0;i<num; i++){
        sum+=arr[i];
        printf("%d\n",sum);
    }
    return sum;
}