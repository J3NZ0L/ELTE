#include <stdio.h>

int xlegkisebb (int* tomb, int meret, int hanyadik);

int rendezes (int* tomb, int meret);

void csere(int* a, int* b);

int main(){
    int T[]={1, 4, -2, 5, 3};
    int meret=sizeof(T)/sizeof(T[0]);
    rendezes(T,meret);
    //printf("%d\n",); 
    for (int i=0;i<meret; i++){
        printf("%d\n",T[i]);
    };
}

int xlegkisebb (int* tomb, int meret, int hanyadik);

int rendezes (int* tomb, int meret){
    
    for (int i=0;i<meret;i++){
        int minertek=tomb[i];
        int mini=i;
        for (int j=i+1; j<meret-1;j++){
            if (minertek>tomb[j]){
                csere(&tomb[mini],&tomb[j]);
            }
        }
    }
}

void csere(int* a, int* b){
    int c;
    c=*a;
    *a=*b;
    *b=c;
}