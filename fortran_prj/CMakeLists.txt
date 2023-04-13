enable_language(Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/fortran_prj/module)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/out)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/fortran_prj/archive)

add_library(fortranLib
    SHARED
        c_interface.f90
        module_1.f90
        module_2.f90
)

add_library(fortranLib_static
    STATIC
        c_interface.f90
        module_1.f90
        module_2.f90
)
set_target_properties(fortranLib_static PROPERTIES  OUTPUT_NAME "fortranLib")
set_target_properties(fortranLib_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)

set_target_properties(fortranLib PROPERTIES VERSION 1.0 SOVERSION 1)
set_target_properties(fortranLib_static PROPERTIES VERSION 1.0 SOVERSION 1)
