


include("${CMAKE_CURRENT_LIST_DIR}/ctoolchain.cmake")



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

ctoolchain__os__use_android(19 armeabi-v7a clang3.7 c++_shared)

ctoolchain__os__use_crystax()

ctoolchain__flags__use_cxx(14)

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
