cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(statistical_filter)

find_package(PCL 1.2 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable(statistical_filter statistical_filter.cpp)
target_link_libraries(statistical_filter ${PCL_LIBRARIES} ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES} pcl_filters)

