


include("${CMAKE_CURRENT_LIST_DIR}/ctoolchain.cmake")



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

ctoolchain__os__use_android(r14b 19 armeabi-v7a clang c++_shared)

ctoolchain__flags__use_cxx(14)

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
