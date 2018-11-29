cmake_minimum_required(VERSION 2.8)

cmake_policy(SET CMP0015 NEW)

set(PROJ_NAME tolua++)
project(${PROJ_NAME} CXX)

set(CXX_LANGUAGE on CACHE INTERNAL "this is a cxx language project")

set(LUA_INSTALL_DIR /opt/third_party/lua)
set(LUA_INC_DIR ${LUA_INSTALL_DIR}/include)
set(LUA_LIB_DIR ${LUA_INSTALL_DIR}/lib)

file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/bin)
file(MAKE_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

add_subdirectory(src/lib)
add_subdirectory(src/bin)
