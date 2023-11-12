cmake_minimum_required(VERSION 3.15...3.23)

set(PARENT_PROJECT_NAME "${PROJECT_NAME}")

project(CmakeConfigPackageTests LANGUAGES CXX)

if(PROJECT_IS_TOP_LEVEL)
  enable_testing()
  find_package(${PARENT_PROJECT_NAME} CONFIG REQUIRED)

  if(NOT TARGET ${PARENT_PROJECT_NAME}_options)
    message(FATAL_ERROR "Required config package not found!")
    return()
  endif()
endif()

include(${Catch2_SOURCE_DIR}/contrib/Catch.cmake)

add_executable(tests)

target_sources(tests
    PRIVATE
        "main.cpp"
)

target_link_libraries(tests
    PRIVATE
        Catch2::Catch2
        # Insert project name here
)

catch_discover_tests(tests
  TEST_PREFIX "unittests."
  REPORTER XML
  OUTPUT_DIR .
  OUTPUT_PREFIX "unittests."
  OUTPUT_SUFFIX .xml
)
