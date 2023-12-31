#ifndef MENU_H  //Program menü
#define MENU_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void print_menu_header();
void fociklus(int* Choice, int** Matrix,int* dimension,bool* rotation, int* direction, char** file_name, FILE** f);
void print_user_guide();
void get_choice(int* choice);

#endif //MENU_H