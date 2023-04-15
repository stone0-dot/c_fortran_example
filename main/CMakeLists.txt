enable_language(C)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/c_prj)
aux_source_directory(. srcs)
 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/c_prj/inc)
 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/out)

add_executable(${CMAKE_PROJECT_NAME} ${srcs})


add_custom_target(
    exist_f90_interface
    DEPENDS ${CMAKE_SOURCE_DIR}/fortran_prj/c_interface.f90
)

add_custom_target(
    generate_c_header
    COMMAND ${CMAKE_COMMAND} -E echo \#pragma once > ${CMAKE_CURRENT_SOURCE_DIR}/inc/c_interface.h
    COMMAND gfortran -fc-prototypes -fsyntax-only -I${CMAKE_BINARY_DIR}/fortran_prj/module ${CMAKE_SOURCE_DIR}/fortran_prj/c_interface.f90 >> ${CMAKE_CURRENT_SOURCE_DIR}/inc/c_interface.h
    DEPENDS fortranLib exist_f90_interface
)

add_dependencies(${CMAKE_PROJECT_NAME} generate_c_header)

target_link_libraries(${CMAKE_PROJECT_NAME}
    cLib
    fortranLib
)