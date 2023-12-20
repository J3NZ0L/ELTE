#include "szamologep.h"

/* 
Menu: 
1. osszeadas
2. kivonas
3. szorzas
4. osztas
5. maradek szamolas
6. kilepes
*/

int main(){
	printf("Szamologep");
	printf("1. osszeadas\n2. kivonas \n3. szorzas \n4. osztas \n5. maradek szamolas \n6. kilepes\n");
	menu();
	return 0;
}

int menu(){
	int choice;
	printf("Hasznalando funkcio:");
	scanf("%d", &choice);
	int num1, num2;
	while (choice>=1 && choice <=5){ 
		printf("Elso szam: ");
		scanf("%d", &num1);
		printf("Masodik szam: ");
		scanf("%d", &num2);
		switch (choice){
			case 1:
				printf("%d\n", num1+num2);
				break;
			case 2:
				printf("%d\n", num1-num2);
				break;
			case 3:
				printf("%d\n", num1*num2);
				break;
			case 4:
				printf("1%f\n", (float)num1/num2);
				break;
			case 5:
				printf("%d\n", num1%num2);
				break;
			default:
				printf("nem jo");
				break;
		}
		printf("Hasznalando funkcio:");
		scanf("%d", &choice);
		
	}
	return 0;
}


