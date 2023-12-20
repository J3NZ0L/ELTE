#include <stdio.h>

int main(){
    //Tombok C-ben: 
    int T[10]; //konkretizaljuk a meretet, elemeit nem
    //vagy:
    int V[]={1,2,3}; //csak az elemeit konkretizaljuk, adott igy a merete is
    //meret lekeres: (byteban)
    printf("%d",sizeof(T)/sizeof(T[0])); //le kell osztani az elemenek a meretevel, mert byteban adna vissza
    
}