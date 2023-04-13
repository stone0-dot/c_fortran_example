module c_interface

    USE module_1
    USE module_2

contains

    function helloworld_interface() bind(C)
        implicit none
        integer(4)::helloworld_interface
        helloworld_interface = helloworld()
    end function

    function foo_interface() bind(C)
        implicit none
        integer(4)::foo_interface
        foo_interface = foo()
    end function

    function add_interface(a, b) bind(C)
        integer(4)::a, b, add_interface
        add_interface = add(a, b)
    end function

end module c_interface