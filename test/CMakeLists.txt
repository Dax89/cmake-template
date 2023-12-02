cmake_minimum_required(VERSION 3.15...3.23)

set(PARENT_TARGET "${PROJECT_NAME}")

project(CmakeConfigPackageTests LANGUAGES CXX)

if(PROJECT_IS_TOP_LEVEL)
  enable_testing()
  find_package(${PARENT_TARGET} CONFIG REQUIRED)

  if(NOT TARGET ${PARENT_TARGET}_options)
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
)

get_target_property(PARENT_TARGET_TYPE ${PARENT_TARGET} TYPE)

if(NOT PARENT_TARGET_TYPE STREQUAL "EXECUTABLE")
    target_link_libraries(tests
        PRIVATE
            ${PARENT_TARGET}
    )
endif()

catch_discover_tests(tests
  TEST_PREFIX "unittests."
  REPORTER XML
  OUTPUT_DIR .
  OUTPUT_PREFIX "unittests."
  OUTPUT_SUFFIX .xml
)
