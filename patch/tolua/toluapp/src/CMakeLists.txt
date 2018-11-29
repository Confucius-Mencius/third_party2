set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

#find_package(Lua REQUIRED)

set(LUA_INSTALL_DIR /opt/third_party/lua)
set(LUA_INCLUDE_DIR ${LUA_INSTALL_DIR}/include)
set(LUA_LIBRARIES ${LUA_INSTALL_DIR}/lib/liblua.so)
set(LUA_VERSION_STRING "5.3.2")

if("${LUA_VERSION_STRING}" VERSION_LESS "5.2.0")
	message(FATAL_ERROR "Lua 5.2.0 or later is required, but found ${LUA_VERSION_STRING}.")
endif()

include_directories(
	"${PROJECT_SOURCE_DIR}/include"
	"${LUA_INCLUDE_DIR}"
)

add_subdirectory(lib)
add_subdirectory(bin)
add_subdirectory(tests)
