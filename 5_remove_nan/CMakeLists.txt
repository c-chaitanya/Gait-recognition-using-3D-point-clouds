cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(remove_nan)
find_package(PCL 1.2 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable(remove_nan remove_nan.cpp)
target_link_libraries (remove_nan ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} pcl_filters)

SET(COMPILE_FLAGS "-std=c++11")
add_definitions(${COMPILE_FLAGS})

