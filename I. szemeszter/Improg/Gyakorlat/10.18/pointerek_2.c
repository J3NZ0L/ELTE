#include <stdio.h>

int local_v(){
    int val= 10;
    int* p = &val;
    return p;
}

int* maxkiv_p(int*t,int hossz);

int* maxkiv_p2(int*t,int hossz);

int main() {
    /*
    int* p = local_v();
    printf("p: %d\n*p: %d\n",p,*p);
    *p=11;
    printf("p: %d\n*p: %d\n",p,*p);
    return 0;

    int * q = NULL;
    printf("q: %d\n *q: %d\n",q,*q);
    */

    //ket azonos tombben levo mutato
    //van egy x elemu tomnbunk, ket mutato a tomb ket elemere mutatnak, melyik mutato mutat a kisebbik indexu elemre?

    int tomb[]={1,2,3,4,5,6};
    int*p1=tomb+3; //*p=2 p=tomb+1
    int*p2=tomb+1;
    if (p1<p2){
        printf("p1 a kisebb indexu");
    } else {
        printf("p2 a kisebb indexu");
    }

    //Adjuk vissza maxkivalasztas fuggvennyel a tomb legnagyobb elemu sorszamat pointerkent

    int* max_v = max(tomb, 6);
    printf("Max: %d - %dth element\n", *max_v, max_v-tomb);

    int val=45;
    int*val_p=&val;
    max_v = max(val_p,1);
}

int* maxkiv_p(int*t,int hossz){
    int maxi=1;
    int maxertek= t[maxi];
    for(int i=0; i<hossz; i++){
        if (t[i]>maxertek){
            maxi=i;
            maxertek=t[i];
        }
    }
    return t+maxi;
}

int* maxkiv_p2(int*t,int hossz){
    int * max_v = t;
    t++;
    for(int i=1; i<hossz; i++){
        max_v=*max_v<*t ? t : max_v;
    }
    return max_v;
}