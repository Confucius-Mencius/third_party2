set(EXE_NAME toluapp)

include_directories(../../include ${LUA_INC_DIR})
link_directories(${LUA_LIB_DIR} ../../lib)

file(GLOB HEADERS ../../include/tolua++.h)
set(CUR_DIR_SRCS tolua.c toluabind.c)
add_executable(${EXE_NAME} ${HEADERS} ${CUR_DIR_SRCS})
target_link_libraries(${EXE_NAME} tolua++ lua m dl)

set_target_properties(${EXE_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
