enable_language(C)
aux_source_directory(. srcs)
 
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)
include_directories(${CMAKE_SOURCE_DIR}/c_prj/inc)
 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build/out)

add_executable(${CMAKE_PROJECT_NAME} ${srcs})

add_custom_target(
    generate_c_header
    DEPENDS ${CMAKE_SOURCE_DIR}/main/inc/c_interface.h
)

add_dependencies(${CMAKE_PROJECT_NAME} generate_c_header)
add_dependencies(generate_c_header fortranLib)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/main/inc/c_interface.h
    COMMAND gfortran -fc-prototypes -fsyntax-only -I${CMAKE_BINARY_DIR}/fortran_prj/module ${CMAKE_SOURCE_DIR}/fortran_prj/c_interface.f90 > ${CMAKE_SOURCE_DIR}/main/inc/c_interface.h
    DEPENDS ${CMAKE_SOURCE_DIR}/fortran_prj/c_interface.f90
)

target_link_libraries(${CMAKE_PROJECT_NAME}
    cLib
    fortranLib
)