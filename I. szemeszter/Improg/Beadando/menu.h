#ifndef MENU_H  //Program menü
#define MENU_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void print_menu_header();
void fociklus(int* Choice, int** Matrix,int* dimension,bool* rotation, int* direction);
void print_user_guide();

#endif //MENU_H