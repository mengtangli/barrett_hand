cmake_minimum_required(VERSION 2.8.3)
project(barrett_hand_hardware_interface)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  controller_manager
  hardware_interface
  roscpp
  actionlib 
  barrett_hand_msgs 
  owd_msgs 
  libpcan 
  libntcan 
  tf
)

include_directories(owd include ${catkin_INCLUDE_DIRS})

catkin_package(
  INCLUDE_DIRS owd include 
  LIBRARIES barrett_hand_hardware_interface
#  CATKIN_DEPENDS roscpp rospy
#  DEPENDS system_lib
)

add_subdirectory(owd)
#add_subdirectory(owd/openwam)
#add_subdirectory(owd/openmath)

add_definitions("-O0 -ggdb3 -DWRIST -DBH8")

add_library(barrett_hand_hardware_interface src/BarrettHandHardwareInterface.cpp)
add_executable(barrett_hand_hardware_interface_node src/Robot.cpp owd/openwamdriver.cpp owd/bhd280.cc owd/ft.cc owd/tactile.cc)
add_definitions("-BH280_ONLY -DBH280 -DBH280_ONLY ${CANBUS_DEFS}")
target_link_libraries(barrett_hand_hardware_interface_node   barrett_hand_hardware_interface bhdcan openwam openmath lapack blas gfortran ${CANBUS_LIBS} ${catkin_LIBRARIES})





