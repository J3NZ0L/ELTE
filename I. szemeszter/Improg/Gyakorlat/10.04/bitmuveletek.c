#include <stdio.h>
#include <ctype.h>
#include <math.h>

char withASCII(char ic);
char withArrays(char ic);

char withFunction(char c);

float korAtmero(int r);
float korKerulet(int r);
float korTerulet(int r);

const double pi=3.14159265358979;

int merolegese(int x1, int y1, int x2, int y2);

struct Pont{
    int x;
    int y;
};

int prime(int szam);
//char[10] intToStr(int r);

int main() {

    /*
    int i=10;

    int var1 =0;
    int var2 =0;

    var1 = ++i;
    printf("var1: %d, i: %d\n",var1,i);
    var2=i++;
    printf("var2: %d, i: %d\n",var1,i);
    */

    //Olvassunk be karaktert, nagybetubol kisbetu, kisbetubol nagybetu

    /*
    int c;
    for (int i=0; i<10; i++){
        printf("Karakter: ");
        c = getchar();
        
        printf(" A beolvasott karakter: %c",c);
    }
    */

   // printf("Irjon be egy karaktert: ");

   // scanf("%c",&c);
   /*
    printf("withASCII: %c\n",withASCII(c));
    printf("Wihtfunc: %c\n",withFunction(c));
    */

    //olvassunk be ket szamot, osszes lehetseges aritmetikai muveletet vegezzuk el rajtuk
    /*
    int x,y;
    printf("Irjon be ket szamot:\n ");
    scanf("%d",&x);
    scanf("%d",&y);
    printf("x+y: %d\n",x+y);
    printf("x-y: %d\n",x-y);
    printf("x/y: %d\n",x/y);
    printf("float x/y: %f\n",(float)x/y);
    printf("x*y: %d\n", x*y);
    printf("x%%y: %d\n",x%y);
    */

   //Tfh. a,b E Z 
   /*
   a,b b<a, meg akarjuk cserelni oket
   a=a+b
   b=a+b-b=a
   a=a+b-a=b
   */

    //adott az r, mennyi a d, k, t?
    /*
    int r;
    printf("Irja be a kor sugarat: ");
    scanf("%d",&r);
    printf("A kor atmeroje: %f, a kor kerulete: %f, a kor terulete: %f\n",korAtmero(r),korKerulet(r),korTerulet(r));
    */

    //nyolc szamjegyu szamot bekapunk, adjuuk ki datumkent

    //ket egyenes kordinataairol eldonteni h merolegesek e
    /*
    struct Pont P1;
    struct Pont P2;
    struct Pont P3;
    struct Pont P4;

    printf("Irja be az egyenesek pontjait: ");
    printf("P1x: ");
    scanf("%d", &P1.x);
    printf("P1y: ");
    scanf("%d", &P1.y);
    printf("P2x: ");
    scanf("%d", &P2.x);
    printf("P2y: ");
    scanf("%d", &P2.y);
    printf("P3x: ");
    scanf("%d", &P3.x);
    printf("P3y: ");
    scanf("%d", &P3.y);
    printf("P4x: ");
    scanf("%d", &P4.x);
    printf("P4y: ");
    scanf("%d", &P4.y);

    printf("%d",merolegese(P1.x,));
    */

   //Prime fgv
    printf("%d",prime(12));
}

char withASCII(char ic){
    if ((ic>=65)&&(ic<=90)){
        return ic+32;
    }
    if ((ic>=97)&&(ic<=122)){
        return ic-32;
    }
}

char withArrays(char ic){
    char upper[26]= {'A','B','C','D','E'};
    char lower[26]= {'a','b','c','d','e'};
    for (int i=0;i<5; i++) {
        if (upper[i]==ic){
            return lower[i];
        }
    }
    for (int i=0;i<5; i++) {
        if (lower[i]==ic){
            return upper[i];
        }
    }
    return 0;

}

char withFunction(char c){
    //#include <ctype.h>
    //isalpha()
    //isdigit()
    if (islower(c)) {return toupper(c);}
    else {return tolower(c);}
    //exit(1); #include <stdlib.h>
}

float korAtmero(int r){
    return 2*r;
}

float korKerulet(int r){
    return 2*r*pi;
}

float korTerulet(int r){
    return r*r*pi;
}
/*
int merolegese(int Ex1, int Ex2, int Ey1, int Ey2, int Fx1, int Fx2, int Fy1, int Fy2){
    int V1x=Ex2-Ex1, V1y=Ey2-Ey1, V2x=Fx2-Fx1, V2y=Fy2-Fy1;  
    return V2x*V1x+V1y*V2y==0;
}
*/

int prime(int szam){
    int i=2;
    while ((i<=trunc(sqrt(szam)))&&(szam%i!=0)){
        i++;
    }
    return i>sqrt(szam);
}