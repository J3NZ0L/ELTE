#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

//palya makroi
#define COL 20
#define ROW 10

#define EMPTY ' '
#define APPLE 'a'

#define APPLE_NUM 10

//kigyo makroi
#define SNAKE_LENGTH 9
#define SNAKE_WIDTH 2

#define SNAKE_HEAD '8'
#define SNAKE_BODY '0'


void init_field(char tomb[ROW][COL], int almaszam){
	for (int i=0; i<ROW; i++){
		for (int j=0; j<COL; j++){
			tomb[i][j]=EMPTY;
		}
	}
	int lerakott_almak=0;
	while (lerakott_almak!=APPLE_NUM){
		int i=rand()%10+1;
		int j=rand()%20+1;
		if (tomb[i][j]==EMPTY){
			tomb[i][j]=APPLE;
			lerakott_almak++;
		}
	}
}

void init_snake(int tomb[2][SNAKE_LENGTH]){
	tomb[0][0]=0;
	tomb[1][0]=0;
	for (int i=0; i<9; i++){
		tomb[0][i]=0; //sor
	}
	for (int j=0; j<9; j++){
		tomb[1][j]=j; //oszlop
	}
}

void print_game(char jatekter_tomb[ROW][COL],int snake_tomb[2][SNAKE_LENGTH]){
	char munka_matrix[ROW][COL];
	for (int i=0; i<ROW; i++){
		for (int j=0; j<COL; j++){
			munka_matrix[i][j]=jatekter_tomb[i][j];
		}
	}
	munka_matrix[snake_tomb[0][0]][snake_tomb[1][0]]=SNAKE_HEAD;
	for (int i=1; i<9; i++){
			munka_matrix[snake_tomb[0][i]][snake_tomb[1][i]]=SNAKE_BODY;
	}
	for (int j=0; j<COL+2; j++){
		printf("X");
	}
	printf("\n");
	for (int i=0; i<ROW; i++){
		printf("X");
		for (int j=0; j<COL; j++){
			printf("%c",munka_matrix[i][j]);
		}
		printf("X");
		printf("\n");
	}
	for (int j=0; j<COL+2; j++){
		printf("X");
	}
}

bool off_road(int snake_head[2], char irany){
		if (((snake_head[0]==0)&&(irany=='w')) ||
		((snake_head[0]==ROW-1)&&(irany=='s')) ||
		((snake_head[1]==0)&&(irany=='a')) || 
		((snake_head[1]==COL-1)&&(irany=='d'))){
			return 1;
		} else {
			return 0;
		}


}

bool collideWithSelf(int snake_tomb[2][SNAKE_LENGTH], int snake_head[2]){
	int i=1;
	while ((i<9) && !((snake_tomb[0][i]==snake_head[0]) && (snake_tomb[1][i]==snake_head[1]))){
		i++;
	}
	return i<9;
}

int update_snake(char jatekter_tomb[ROW][COL],int snake_tomb[2][SNAKE_LENGTH],char elmozdulas){
	static int apple_consumed=0;
	int old_snake_head[2]={snake_tomb[0][0],snake_tomb[1][0]};
	switch(elmozdulas ) {	
		case 'a':
			snake_tomb[1][0]=snake_tomb[1][0]-1;
			break;
		case 'w':
			snake_tomb[0][0]=snake_tomb[0][0]-1;
			break;
		case 's':
			snake_tomb[0][0]=snake_tomb[0][0]+1;
			break;
		case 'd':
			snake_tomb[1][0]=snake_tomb[1][0]+1;
			break;
		default: return -10;
	}	
	int new_snake_head[2]={snake_tomb[0][0],snake_tomb[1][0]};
	if (!(off_road(old_snake_head, elmozdulas))){
		//if (jatekter_tomb[snake_tomb[0][0]][snake_tomb[1][0]]!=SNAKE_BODY){
			if (!(collideWithSelf(snake_tomb,new_snake_head))){
			printf("%c",jatekter_tomb[snake_tomb[0][0]][snake_tomb[1][0]]);
			printf("\n");
				snake_tomb[0][0]=old_snake_head[0];
				snake_tomb[1][0]=old_snake_head[1];
				for (int i=8; i>0; i--){
					snake_tomb[0][i]=snake_tomb[0][i-1]; //sor
				}
				for (int i=8; i>0; i--){
					snake_tomb[1][i]=snake_tomb[1][i-1]; //sor
				}
				snake_tomb[0][0]=new_snake_head[0];
				snake_tomb[1][0]=new_snake_head[1];
			if (jatekter_tomb[snake_tomb[0][0]][snake_tomb[1][0]]!=APPLE){
				return 0;
			} else if ((apple_consumed+1)!=APPLE_NUM){
				jatekter_tomb[snake_tomb[0][0]][snake_tomb[1][0]]=' ';
				apple_consumed+=1;
				return 1;
			} else {
				return 10;
			}
		} else {
			return -2;
		}
	} else {
		return -1;
	}		
}

int main() {
	printf("Szervusz player1!");
	printf("Jatsszunk egy jatekot: ");
	printf("A jatek neve snake.");
	printf("Egyfelekeppen szabadulhatsz ki: addig kell nyomogatnod az awsd gombokat amig az osszes almat meg nem eszi a kigyod!");
	printf("Kezdodjek hat a jatek!!");
	printf("\n");
	printf("===========================================================================");
	printf("\n");
	srand(time(NULL));
	char jatekter[ROW][COL];
	int snake[2][SNAKE_LENGTH];
	init_field(jatekter,APPLE_NUM);
	init_snake(snake);
	print_game(jatekter,snake);
	printf("\n");
	char inputstream[100];
	char inputchar;
	int enter;
	int return_val;
	while (1) {
		gets(inputstream);
		enter=0;
		while (inputstream[enter]!='\0'){
			enter++;
		}
		for (int i=0; i<enter; i++){			
			inputchar=inputstream[i];
			
			if ((inputchar=='a') || (inputchar=='w') || (inputchar=='s') || (inputchar=='d')){
				return_val=update_snake(jatekter,snake,inputchar);
				//printf("%d",return_val);
				if (return_val>=0){
					print_game(jatekter,snake);
					printf("\n");
					if (return_val==10){
						printf("\n");
						printf("YOU HAVE WON THE GAME!");
						printf("\n");
						break;
					}
				} else {
					printf("\n");
					printf("GAME OVER");
					printf("\n");
					break;
				}
			}
			
		}
		//printf("%c",'c');
	}
	
	
}