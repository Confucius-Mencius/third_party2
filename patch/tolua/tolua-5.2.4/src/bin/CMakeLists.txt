set(EXE_NAME toluax)

include_directories(${LUA_INC_DIR} ../../include)
link_directories(${LUA_LIB_DIR} ../../lib)

set(BIN_SRCS tolua.c toluabind.c)
add_executable(${EXE_NAME} ${HEADERS} ${BIN_SRCS})
target_link_libraries(${EXE_NAME} tolua lua m dl)

set_target_properties(${EXE_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
