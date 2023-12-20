#include <stdio.h>
#include <math.h>

int length(char* T);

int main(){
    int hexNum;
    char hexString[10];
    /*
    int hexM[100];
    int hexM_1=0;
    //int scan_ret = scanf("%s", hexString);
    while (1){
        int scan_ret = scanf("%s", hexString);
        if (scan_ret==EOF) {
            break;
        }
        int l = length (hexString);
        int i=l-1;
        int j=0;
        while (i>=0){
            int dec=(int)hexString[i];
            if  (dec>= 48 && dec <= 57){
                dec -= 48;
                j+=1;
            } else if (dec >=65 && dec <=70){
                dec -= 55;
                j+=1;
            } else if ( dec >= 97 && dec <= 102){
                dec -=87;
                j+=1;
            } else {
                printf("Wrong character: %c\n", hexString[i]);
            }
            hexNum+= pow (16, j-1) * dec;
        }
        hexM[hexM_1] = hexNum;
        hexM_1 ++;
        printf ("Hex : %s - Dec : %d\n", hexString, hexNum);
    }
    */
   hexNum = (int)strtol(hexString, NULL, 16);
    return 0;
}

int length(char* T){
    int i=0;
    while (*T!='\0'){
        i++;
    }
    return i;
}