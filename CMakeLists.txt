cmake_minimum_required(VERSION 3.19.8)

# passed as cmake -D FOO=foovalue
# message(${FOO})

project(YMLCFG VERSION 1.0)

set(TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)
set(LIBS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/include)

include(${LIBS_DIR}/CMakeLists.txt)
include(${TEST_DIR}/CMakeLists.txt)

