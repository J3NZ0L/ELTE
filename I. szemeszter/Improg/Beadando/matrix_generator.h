#ifndef MATRIX_GENERATOR_H
#define MATRIX_GENERATOR_H

#include <string.h>
#include <stdbool.h>

void generate_matrix(int*** Matrix, int N, int D, bool R);
void free_matrix(int*** matrix, int N);
void get_dimension(int* dim);
void get_direction(int* dir);
void get_rotation(bool* rot);

#endif