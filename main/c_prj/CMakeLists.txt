aux_source_directory(. srcs)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/inc)

set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/out)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/c_prj/archive)

add_library(cLib
    SHARED
        ${srcs}
)

add_library(cLib_static
    STATIC
        ${srcs}
)
set_target_properties(cLib_static PROPERTIES  OUTPUT_NAME "cLib")
set_target_properties(cLib_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)

set_target_properties(cLib PROPERTIES VERSION 1.0 SOVERSION 1)
set_target_properties(cLib_static PROPERTIES VERSION 1.0 SOVERSION 1)