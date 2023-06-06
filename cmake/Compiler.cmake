if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    include(cmake/compiler/GNU.cmake)

    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        include(cmake/sanitizer/GNU.cmake)
    endif()
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    include(cmake/compiler/MSVC.cmake)

    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        include(cmake/sanitizer/MSVC.cmake)
    endif()
else()
    message(FATAL_ERROR "Unsupported compiler flags: '${CMAKE_CXX_COMPILER_ID}'")
endif()
