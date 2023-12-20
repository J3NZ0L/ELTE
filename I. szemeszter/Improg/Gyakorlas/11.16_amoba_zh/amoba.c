#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <stdbool.h>

int row=6;
int col=7;

void init(int tabla[row][col]);

void printTable(int tabla[row][col]);

int legal(int tabla[row][col], int oszlop);

int submit(int tabla[row][col], int player, int oszlop);

int evaluate(int tabla[row][col]);

void game(int tabla[row][col], char dobassorrend[100]);

//-------------------MAIN------------------------
int main(){
	int tabla[row][col];
	init(tabla);
	printTable(tabla);
	char dobasok[100];
	gets(dobasok);
	game(tabla, dobasok);
}
//-------------------\MAIN-----------------------


void init(int tabla[row][col]){
	for (int i=0; i<row; i++){
		for (int j=0; j<col; j++){
			tabla[i][j]=0;
		}
	}
}

void printTable(int tabla[row][col]){
	for (int i=0; i<row; i++){
		for (int j=0; j<col; j++){
			printf("%d",tabla[i][j]);
		}
		printf("\n");
	}
}

int legal(int tabla[row][col], int oszlop){
	if ((tabla[0][oszlop]==0)){
		if ((oszlop<7)&&(oszlop>=0)){
			return 1; //legalis lepes
		}else {
			return -2; //nem letezo oszlop
		}
	}else{
		return -1; //teli oszlop
	}
	
}

int submit(int tabla[row][col], int player, int oszlop){
	int legal_val=legal(tabla,oszlop);
	if (legal_val==1){
		int i=0;
		while ((i<5)&&tabla[i+1][oszlop]==0){
			i++;
		}
		tabla[i][oszlop]=player;
	} else if (legal_val==-1) {
		printf("Illegalis lepes: %c oszlopban mar nincs tobb hely", oszlop+65);
	} else{
		printf("Illegalis lepes: %c oszlop nincs", oszlop+65);
	}
	return legal_val;
}

int evaluate(int tabla[row][col]){
	for(int i=0; i<row-2; i++){
		for(int j=0; j<col-2; j++){
			if ((tabla[i][j]==tabla[i][j+1])&&(tabla[i][j]==tabla[i][j+2])){
				if (tabla[i][j]==1){
					printf("First player wins");
				}
				else{
					printf("Second player wins");
				}
				if ((tabla[i][j]==tabla[i+1][j])&&(tabla[i][j]==tabla[i+2][j])){
					if (tabla[i][j]==1){
						printf("First player wins");
					}
				else{
					printf("Second player wins");
				}
				}
				return 1;
			}
		}
	}
	int i=0;
	while ((i<col)&&(tabla[0][i]!=0)){
		i++;
	}
	if (i==col){
		printf("Draw");
		return -1;
	}
	return 0;
}

void game(int tabla[row][col], char dobassorrend[100]){
	int i=0;
	int val_eval=0;
	int dobas;
	while ((dobassorrend[i]!='\0')&&(val_eval==0)){
		
		dobas=(int)dobassorrend[i]-65;
		if (legal(tabla, dobas)){
			submit(tabla, i%2+1, dobas);
			printTable(tabla);
			val_eval=evaluate(tabla);
		}
		i++;
	}
	
}

//ABDCAGEEE




