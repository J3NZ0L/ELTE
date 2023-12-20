#include <stdio.h>
#include <stdbool.h>

#define HEIGHT 10
#define WIDTH 10

#define SHIP 'O'
#define EMPTY '.'

#define EMPTS
#define SHIPS_LEN 6

#define FUGG '|'
#define VIZSZ '_'

int init(char table[HEIGHT][WIDTH], int ship_table[SHIPS_LEN]){
    for (int i=0; i<HEIGHT; i++){
        for (int j=0; j<HEIGHT; j++){
            table[i][j]=EMPTY;
        }    
    }
    for (int i=0; i<2; i++){
        ship_table[i]=0;
    }
    for (int i=2; i<SHIPS_LEN; i++){
        if (i==3){
            ship_table[i]++;
        }
        ship_table[i]=1;
    }
    return 0;
}

int printTable(char table[HEIGHT][WIDTH]){
    for (int i=0; i<HEIGHT; i++){
        for (int j=0; j<HEIGHT; j++){
            printf("%c ",table[i][j]);
        }    
        printf("\n");
    }
    return 0;
}



int submit(char table[HEIGHT][WIDTH], int ship_table[SHIPS_LEN], int start_pos_row, int start_pos_col, int ship_length, int orientation){

}

int main(){
    char tabla[HEIGHT][WIDTH];
    int hajohossztabla[SHIPS_LEN];
    init(tabla,hajohossztabla);
    printTable(tabla);
    return 0;
}