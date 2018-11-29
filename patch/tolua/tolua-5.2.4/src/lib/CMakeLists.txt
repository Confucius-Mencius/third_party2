set(LIB_NAME tolua)

include_directories(${LUA_INC_DIR} ../../include)

set(LIB_SRCS tolua_event.c tolua_is.c tolua_map.c tolua_push.c tolua_to.c)
# add_library(${LIB_NAME} STATIC ${LIB_SRCS}) -- 静态库
add_library(${LIB_NAME} SHARED ${LIB_SRCS})

# set_target_properties(${LIB_NAME} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib) -- 静态库的输出目录
set_target_properties(${LIB_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
