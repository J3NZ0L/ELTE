#ifndef MATRIX_IMPORTER_H
#define MATRIX_IMPORTER_H

#include <stdio.h>
#include <string.h>
#include <io.h>
#include <stdbool.h>

int import_matrix(int*** Matrix,int dimension, char* file_name);
void get_filename(char file_name[13]);

#endif //MATRIX_IMPORTER_H