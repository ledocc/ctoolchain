


include("${CMAKE_CURRENT_LIST_DIR}/ctoolchain.cmake")



##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

ctoolchain__compiler__use_gcc()

ctoolchain__flags__use_last_cxx_version()

ctoolchain__flags__build_64bit()
ctoolchain__clean__var_init_list()

##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
