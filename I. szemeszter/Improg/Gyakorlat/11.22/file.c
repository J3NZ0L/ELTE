#include "file.h"

//1. feladat: egyszeru mulatsagot, osszes feladatot egy fajlban oldjuk meg, es ki lehessenn valasztani hogy melyiket szeretnenk a fajllal megoldani

int main(int argc, char** argv){
	printf("%s\n", argv[0]);
	if (argc != 2){
		printf("Please provide one number as argument.\n");
		return 1;
	}
	int num = argv[1][0] - '0';
	choose_module(num);
	return 0;
}

void choose_module(int num){
	switch (num){
		case 1:
			count_string();
			break;
		case 2:
			compare_strings();
			break;
		case 3:
			copy_string();
			break;
		case 4: 
			string_upper();
			break;
		case 5: 
			is_palindrom();
			break;	
		case 6: 
			product_to_file();
			break;	
		default:
			printf("There is no option like %d", num);
			break;
	}
}

void count_string(){
	char S[MAX_STRING];
	printf("String:");
	fgets(S, MAX_STRING, stdin);
	//printf("%s",S);
	int i=0;
	int karakterek=0;
	int szavak=0;
	while (S[i] != '\0'){
		if (S[i] == ' ' || S[i] == '\n'){
			szavak++;
		} else {
			karakterek++;
		}
		i++;
	}
	
	printf("Karakterek: %d, szavak: %d\n", karakterek, szavak);
}
//Feladat: ha ugyanolyanok akkor 0, ha az elso nagyobb akkor -1, ha a masodik akkor 1 a visszateresi ertek.
void compare_strings(){
	char S1[MAX_STRING];
	char S2[MAX_STRING];
	
	printf("Elso string: ");
	fgets(S1, MAX_STRING, stdin);
	
	
	printf("Masodik string: ");
	fgets(S2, MAX_STRING, stdin);
	
	printf("Eredmeny: %d\n", strcmp(S1, S2));
	
}

void copy_string(){
	char S1[MAX_STRING];	
	char S2[MAX_STRING];
	
	printf("String: ");
	fgets(S1, MAX_STRING, stdin);
	/*
	int i= 0;
	while (S1[i] != '\0') {
			S2[i]= S1[i];
			i++;
	}
	S2[i] = '\0';
	printf("S2: %s\n", S2);
	*/
	strcpy(S2, S1);
	printf("S2: %s\n", S2);
}
	//FAJLKEZELES::
void string_upper() {
	char S[MAX_STRING];
	FILE*  f = fopen("./szoveg.txt", "r");
	fgets(S, MAX_STRING, f);
	//printf("Szoveg: %s\n", S);
	//printf("Szoveg: \n%s\n", strupr(S));
	
	int i = 0; 
	while (S[i] != '\0'){
		S[i]= toupper(S[i]);
		i++;
	}
	printf("Szoveg: \n%s\n", S);
	FILE* f_out = fopen("./text_out.txt", "w");
	fprintf(f_out, "%s", S);
	fclose(f_out);
	printf("Szoveg:\n%s\n", S);
	
}

void is_palindrom(){
	char  S[MAX_STRING];
	printf("String: ");
	fgets(S, MAX_STRING, stdin);
	/*
	int l=0;
	while (S[l] != '\0'){
		l++;
	}*/
	int l= strlen(S)-1;
	char * from = S;
	char* to = &(S[l-1]);
	while (*to != *from){
			if (*to != *from || from<to){
				break;
			}
			from ++;
			to--;
	}
	if (from>=to){
		printf("%s szo palindrom.\n", S);
	} else{
		printf("%s szo nem palindrom.\n", S);
	}
}

//hozz letre ketto fajlt ami ugyanannyi tetsz szamu szamot tartalmaz, harmadik fajlba a megfelelo szamok szorzatat irassuk ki
void product_to_file(){
	FILE* f1= fopen("./szamok1.txt", "r");
	FILE* f2= fopen("./szamok2.txt", "r");
	FILE* fout= fopen("./szamokszorzata.txt", "w");
	int num1, num2, nump;
	while (((fscanf(f1,"%d", &num1)) != EOF) && (fscanf(f2, "%d", &num2,)!=EOF)){
		nump=num1*num2;
		printf("%d * %d = %d\n", num1, num2, nump);
		fprintf(fout, "%d", nump);
	}
	fclose(f1);
	fclose(f2);
	fclose(fout);
}
