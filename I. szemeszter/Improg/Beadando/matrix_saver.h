#ifndef MATRIX_SAVER_H
#define MATRIX_SAVER_H

#include <string.h>
#include <stdbool.h>

char* itostr(int num,int maxlength);
void save_matrix(int** Matrix,int dimension, int direction,bool rotation);

#endif //MATRIX_SAVER_H