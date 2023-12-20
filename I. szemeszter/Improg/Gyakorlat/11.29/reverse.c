#include <reverse.h>

int main(){
    char T[] ="Sziauram";
    reverse(T);
    printf("Word: %s\n",T);
    reverse(T);
    printf("Word: %s\n",T);
    char *S = reverse_d(T);
    printf("Word: %s\n",S);
    free(S);


    return 0;

}

void reverse(char* T){
    int l = strlen(T);
    for (int i=0, j=l-1; i<j; i++, j--){
        char sw = T[i];
        T[i]=T[j];
        T[j]=sw;
    }
    
}

char* reverse_d(char* T) {
    int l=strlen(T);
    char* S = malloc(l * sizeof(char));
    for (int i= l-1; i>=0; i--) {
        S[l-1-i]=T[i];
        // *(S+l+1-i) - T[i];
    }
    S[l]='\0';
    return S;
}