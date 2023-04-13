module module_1

contains

    function helloworld()
        implicit none
        integer::helloworld
        print*, "hello world!"
        helloworld = 0
    end function

    function add(a, b)
        implicit none
        integer::a,b
        integer::add
        add = a + b
        return
    end function

end module module_1