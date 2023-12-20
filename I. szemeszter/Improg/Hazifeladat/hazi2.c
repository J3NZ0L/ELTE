#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "guess.h"
int countRandom(int lower, int upper) {
        return (rand() % (upper - lower + 1)) + lower;
}
int main() {
        srand(time(NULL));
        printf("Number guesser game! On which difficulty level would you like to play? (1) Easy, (2) Medium, (3) Hard \n");
        int diff;
        int upp_limit;
        scanf("%d",&diff);
        switch (diff) {
                case 1 :upp_limit=10; break;
                case 2 :upp_limit=100; break;
                case 3 :upp_limit=1000; break;
                default: printf("A beirt szam nem tartozik szinthez."); break;
        }

        int num=countRandom(0,upp_limit);
        int guess;
        int num_of_guesses=0;
        do {
                num_of_guesses++;
                //char eredmeny[]=guess <num ? "Nagyobb" : "Kisebb" )
                printf("What is your guess? ");
                scanf("%d",&guess);
                if (guess>num){
                        printf("Guess lower!\n");
                } else if(guess<num){
                        printf("Guess higher!\n");
                }
        } while (guess!=num);
        printf("You guessed it, for the %d. time!! The number was: %d, ",num_of_guesses, num);
        switch (num_of_guesses){
                case 1:
                        printf("Lucky sheet\n");
                        break;
                case 2:
                        printf("Better than me O_o\n");
                        break;
                case 3:
                        printf("Wow\n");
                        break;
                case 4:
                        printf("Pretty good\n");
                        break;
                case 5:
                case 6:
                        printf("Not bad\n");
                        break;
                case 7:
                        printf("That was the goal\n");
                        break;
                default:
                        printf("U r lame ars\n");
                        break;
        }
        return 0;
}
~
~
~
~
~
~
~
-- VISUAL --                                                                                                                                                     61        61,2          Bot
