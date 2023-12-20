#include <stdio.h>

int main(){
    char s1[]="almamater";
    char s2[]="alma";
    int hatar;
    if (sizeof(s1)<sizeof(s2)){
        hatar=sizeof(s1)/sizeof(s1[0]);
    }
    int i=0;
        while((s1[i]<s2[i])&&(i<hatar)){
            i++;
        }
    if (i<hatar){
        printf("%s elorebb van mint %s",s1,s2);
    } else
         printf("%s elorebb van mint %s",s2,s1);
}