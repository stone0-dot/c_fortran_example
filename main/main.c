#include <stdio.h>
#include "c_interface.h"
#include "src_1.h"
#include "src_2.h"

int main(int argc, char* argsv[]){
    int a = 1, b = 1;
    int result = add_interface(&a, &b);
    foo_interface();
    helloworld_interface();
    example_1();
    example_2();
    printf("add_interface(1, 1) = %d\n", result);
    return 0;
}