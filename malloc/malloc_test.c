#include <stdlib.h>
#include <stdio.h>

typedef struct 
{
    int age;
    char name[10];
}Person;

int main()
{
    Person* p1 = malloc(sizeof(Person));
    p1->age = 1;
    snprintf(p1->name, sizeof(p1->name), "%s", "this is p1");
    Person* p2 = malloc(sizeof(Person));
    p2->age = 2;
    snprintf(p2->name, sizeof(p2->name), "%s", "this is p2");
    Person* p3 = malloc(sizeof(Person));
    p3->age = 3;
    snprintf(p3->name, sizeof(p3->name), "%s", "this is p3");

    free(p1);
    free(p2);
    free(p3);
    return 0;
}
