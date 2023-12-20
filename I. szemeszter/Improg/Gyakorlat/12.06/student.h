#ifndef STUDENT_H
#define STUDENT_H

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

//typedef struct _Student Student; //tkeppen tipusszinonima
struct _Student {
    int id;
    float avg;
    int age;
};

typedef struct {
    int id;
    float avg;
    int age;
    studType type;
    info Info;
} student;


int max_avg(student* T, int size); // kap egy student tombotvisszaadja a tanulonak aza azonositojat akinek a legmagasabb az atlaga

//kozlekedesi lampak allapotait szeretnenk eltarolni (p s z)
//typedef enum lightState lightState;
typedef enum {
    Red,
    Yellow,
    Green
    }lightState;

typedef enum {
    BSc,  //0
    MSc,  //1 ,ha Msc =14 akkor PhD 15 lesz, mindig elozo+1
    PhD   //2
    }studType;

typedef enum{
    BSc //ezen ki fog akadni a fordito, nem lehet ugyanolyan key az enumeralt typeokhoz
}anotherType;

typedef struct{
    double imp_factor;
    int Erdos_num;

}PhDInfos;

typedef union { //merete a legnagyobb benne levo tipuselem meretevel egyenlo
    int num_of_courses;
    double credit_index;
    PhDInfos pinf;
}info;


//3. feladat
    //irjunk egy student*init fgv-t

student* init_student(studType studtype);
#endif