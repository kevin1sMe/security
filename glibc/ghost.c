#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define CANARY "in_the_coal_mine"


struct {
    char buffer[1024];
    char canary[sizeof(CANARY)];
} temp = {"buffer", CANARY};

int main(void){
    struct hostent resbuf;
    struct hostent *result;
    int herrno;
    int retval;

    size_t len = sizeof(temp.buffer) - 16*sizeof(unsigned char) - 2*sizeof(char*) -1;

    char name[sizeof(temp.buffer)];
    memset(name, '0', len);
    name[len] = '\0';

    retval = gethostbyname_r(name, &resbuf, temp.buffer, sizeof(temp.buffer), &result, &herrno);
    if(strcmp(temp.canary, CANARY) != 0) {
        puts("vulnerable");
        exit(0);
    }

    if(retval == ERANGE) {
        puts("not vulnerable") ;
        exit(0);
    }

    puts("should not happen");
    return -1;
}

