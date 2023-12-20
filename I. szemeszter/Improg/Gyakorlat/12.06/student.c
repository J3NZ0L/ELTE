#include "student.h"


int main(){
    srand(time(NULL));
    student stud1 = {1, 2.8, 20, BSc};
    student stud2 = {2, 2.0, 21, MSc};
    student stud3 = {3, 3.6, 19, BSc};
    student stud4 = {4, 1, 20}, PhD;
    student sT[4]={stud1,stud2,stud3,stud4};
    /*
    stud1.id=1;
    stud1.avg = 2.8;
    stud1.age = 20;
    */
    //struct tartalmanak kiiratasa
    printf("ID: %d\n",stud1.id);
    printf("Avg: %f\n",stud1.avg);
    printf("Age: %f\n",stud1.age);
    //Struct meretenek kiiratasa = altalaban structon beluli tipusok meretenek osszege
    printf("struct merete: %d\n",sizeof(stud1));
    printf("Maximum atlag: %f\n",max_avg(sT,4));
    
    //3. feladat
    student* student = init_student(BSc);
    if (student == NULL){
        return 1;
    }
    free(student);

    student** S = malloc (10*sizeof(student*));
    for (int i=0; i<10; i++){
        int r= rand() %3;
        switch (r){
            case 0 : S[i]=init_student(MSc); break;
            case 1 : S[i]=init_student(PhD); break;
            case 2 : S[i]=init_student(BSc); break;
        }
        S[i] = init_student();
    }
    for (int i=0; i<10; i++){
        printf("ID: %d\nAvg: %f\nAge: %d\nType: %d\n",
        S[i]->id, S[i]->avg, S[i]->age, S[i]->type);
        free(S[i]);
    }
    

    //4. feladat a studentekbol allo tombben most a max atlagu tanulora mutato pointert adjuk vissza

    return 0;
}

int max_avg(student* T, int size){
    int max=T[0].avg;
    int maxid=T[0].id;
    for(int i=1; i<size; i++){
        if (T[i].avg>max){
            max=T[i].avg;
            maxid=T[i].id;
        }
    }
    return maxid;
}

student* init_student(studType studtype){
    student* Student = malloc(sizeof(Student));
    Student->type=studtype;
    Student->id = rand()%100 +1;
    Student-> avg = (float) (rand()%50+1)/10;
    Student-> age = rand() %12+10;
    switch(Student->type){
        case BSc:
            Student->Info.num_of_courses = rand()% 10+15;
            break;
        case MSc:
            Student->Info.credit_index = 25+(rand() % 10);
            break;
        case PhD:
            Student->Info.pinf.imp_factor = (float)(rand() % (100+1));
            Student->Info.pinf.Erdos_num = rand() % 10 +1;
            break;
        default:
            free(Student); //azt jelentene h gaz van ilyenkor fell kell szabaditani a memoriat
            return NULL;
            break;
    }

    return Student;
}

student* max_avg(student* T, int size){
    float max=T[0].avg;
    int maxi=0;
    for(int i=1; i<size; i++){
        if (T[i].avg>max){
            max=T[i].avg;
            maxi=i;
        }
    }
    return &(T[maxi]);

    float max = T[0]->avg;
    Student* st = T[0];
    for (int i=1; )
}