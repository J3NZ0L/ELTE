#include "menu.h"
#include "matrix_generator.h"
#include "matrix_printer.h"
#include "matrix_saver.h"
#include "matrix_importer.h"

int main(){
    int** actual_matrix=NULL;
    char* file_name=NULL;
    int dim;
    bool rotation; //cw
    int direction; //f
    FILE* f;
    print_menu_header(); //Elso menu kiiratas

    int choice; // Elso valasztas bekerese
    get_choice(&choice);
    fociklus(&choice,actual_matrix,&dim,&rotation,&direction,&file_name,&f);
    return 0;
}










