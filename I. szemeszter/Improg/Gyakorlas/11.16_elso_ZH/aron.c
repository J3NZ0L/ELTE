#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*1*/

void init_game(char palya[10][8], char polymino[2][2]) {
	for (int i = 0; i < 10; i ++) {
		for (int k = 0; k < 8; k ++) {
			palya[i][k] = ' ';
		}
	}
	
	for (int i = 0; i < 2; i ++) {
		for (int k = 0; k < 2; k ++) {
			polymino[i][k] = ' ';
		}
	}
}

/*2*/
void next_polyomino(char polymino[2][2]) {
	
	int randomszam = rand() % 2 + 1;
	int randomszam2 = rand() % 2 + 1;
	int randomszam3 = rand() % 2 + 1;
	int randomszam4 = rand() % 2 + 1;
	
	if (randomszam == 1) {
		polymino[0][0] = 'O';
	}
	if (randomszam == 2) {
		polymino[0][0] = ' ';
	}
	if (randomszam2 == 1) {
		polymino[0][1] = 'O';
	}
	if (randomszam2 == 2) {
		polymino[0][1] = ' ';
	}
	if (randomszam3 == 1) {
		polymino[1][0] = 'O';
	}
	if (randomszam3 == 2) {
		polymino[1][0] = ' ';
	}
	if (randomszam4 == 1) {
		polymino[1][1] = 'O';
	}
	if (randomszam4 == 2) {
		polymino[1][1] = ' ';
	}
	
	if (polymino[1][0] == ' ' && polymino[1][1] == ' ') {
		polymino[0][0] = ' ';
		polymino[0][1] = ' ';
		polymino[1][0] = polymino[0][0];
		polymino[1][1] = polymino[1][0];
	}
		
	
	
	
	
	
}

/*3*/
void print_game(char palya[10][8], char polymino[2][2]) {
	printf("Next polymino:\n");
	for (int i = 0; i < 2; i++) {
		for (int k = 0; k < 2; k++) {
			printf("%c", polymino[i][k]);
		}
	printf("\n");
	}
	
	printf("  12345678 \n");
	for (int i = 0; i < 10; i ++) {
		printf("\n%d:|", i);
		for (int k = 0; k < 8; k ++) {
			printf("%c", palya[i][k]);
		}
	printf("|");
	}
	
	printf("\n  12345678");
	printf("\n");
	
}

//4
void update_game(char palya[10][8], char polymino[2][2], int xpoz) {
	printf("A %d. sorba teszem\n", xpoz);
	int joeee = 0;
	
	
	if (palya[0][xpoz] == 'O') {
		printf(" -2 ");
		joeee = 1;
	}
	if(xpoz == 😎 {
		printf(" -1 ");
		joeee = 2;
	}
	
	if (joeee == 0) {
		printf("        jo lepes ");
	}
	printf("\n");
	
	
	
	
	
	xpoz -= 1;
	int bal = 0;
	while ( bal < 10) {
		if (palya[bal][xpoz] == 'O') {
			break;
		}
		bal += 1;
	}
	
	int jobb = 0;
	while ( jobb < 10 ) {
		if (palya[jobb][xpoz+1] == 'O') {
			break;
		}
	jobb += 1;
	}
	
	
	
	int vegea = 0;
	bal = bal - 1;
	jobb = jobb -1;
	xpoz += 1;
	if ( bal < 1 || jobb < 1) {
		printf("!!!!!!!!!vege a jateknak!!!!!!!!!");
		joeee = 3;
	}
	
	
	
	xpoz -= 1;
	printf("\n");
	if (jobb >= bal) {
		palya[bal][xpoz] = polymino[1][0];
		palya[bal-1][xpoz] = polymino[0][0];
		palya[bal][xpoz+1] = polymino[1][1];
		palya[bal-1][xpoz+1] = polymino[0][1];
	}
	if (bal > jobb) {
		palya[jobb][xpoz] = polymino[1][0];
		palya[jobb-1][xpoz] = polymino[0][0];
		palya[jobb][xpoz+1] = polymino[1][1];
		palya[jobb-1][xpoz+1] = polymino[0][1];
	}
	
	
	
}



int main () {
	srand(time(NULL));
	
	printf("avajkhkja");
	
	
	char palya[10][8];
	char polymino[2][2];
	
	init_game(palya, polymino);
	
	next_polyomino(polymino);
	
	/*print_game(palya, polymino);
	next_polyomino(polymino);
	update_game(palya, polymino, 3);
	print_game(palya, polymino);
	next_polyomino(polymino);
	update_game(palya, polymino, 6);
	print_game(palya, polymino);
	next_polyomino(polymino);
	update_game(palya, polymino, 4);
	print_game(palya, polymino);
	next_polyomino(polymino);
	update_game(palya, polymino, 4);
	print_game(palya, polymino);*/
	
	
	printf("\n");
	next_polyomino(polymino);
	print_game(palya, polymino);
	int joeee = 0;
	while (joeee != 3) {
		int bem;
		scanf("%d", &bem);
		update_game(palya, polymino, bem);
		next_polyomino(polymino);
		print_game(palya, polymino);
	}

	
	return 0;
}