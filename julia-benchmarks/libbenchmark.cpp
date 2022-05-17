#include <string>


//extern "C"{
//    int    fn0();
//    int    fn1(int);
//    double fn2(int, double);
//    char * fn3(int, double, char *);
//}

extern "C" {
int fn0() {
    return 1;
}


int fn1(int x) {
    return x;
}


double fn2(int x, double y) {
    return y;
}


char * fn3(int x, double y, char * s) {
    return s;
}
}