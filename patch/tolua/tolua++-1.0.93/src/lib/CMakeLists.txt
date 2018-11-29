set(LIB_NAME tolua++)

include_directories(../../include ${LUA_INC_DIR})

file(GLOB HEADERS ../../include/tolua++.h)
aux_source_directory(. CUR_DIR_SRCS)
# add_library(${LIB_NAME} STATIC ${HEADERS} ${CUR_DIR_SRCS}) -- ¾²Ì¬¿â
add_library(${LIB_NAME} SHARED ${HEADERS} ${CUR_DIR_SRCS})

# set_target_properties(${LIB_NAME} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib) -- ¾²Ì¬¿âµÄÊä³öÄ¿Â¼
set_target_properties(${LIB_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
