#ifndef MATRIX_IMPORTER_H
#define MATRIX_IMPORTER_H

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void import_matrix(int*** Matrix,int dimension,  FILE** f);
void get_filename(char** file_name);

#endif //MATRIX_IMPORTER_H