module module_2
    contains
        function foo()
            implicit none
            integer::foo
            print*, "foo!"
            foo = 0
        end function
    end module module_2