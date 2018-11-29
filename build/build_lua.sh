#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build lua..."

cd ${LUA_SRC_DIR}

cp -f ${PATCH_DIR}/${LUA_BASENAME}/Makefile ./
cp -f ${PATCH_DIR}/${LUA_BASENAME}/src/Makefile ./src/

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} linux INSTALL_TOP=${LUA_INSTALL_DIR} \
        MYCFLAGS="-fPIC -I${READLINE_INSTALL_DIR}/include" \
        MYLDFLAGS="-L${READLINE_INSTALL_DIR}/lib -L${NCURSES_INSTALL_DIR}/lib" \
        MYLIBS="-lreadline -lncurses"

    sudo make linux INSTALL_TOP=${LUA_INSTALL_DIR} \
        MYCFLAGS="-fPIC -I${READLINE_INSTALL_DIR}/include" \
        MYLDFLAGS="-L${READLINE_INSTALL_DIR}/lib -L${NCURSES_INSTALL_DIR}/lib" \
        MYLIBS="-lreadline -lncurses" install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} linux INSTALL_TOP=${LUA_INSTALL_DIR} \
        MYCFLAGS="-fPIC -I${READLINE_INSTALL_DIR}/include" \
        MYLDFLAGS="-L${READLINE_INSTALL_DIR}/lib -L${NCURSES_INSTALL_DIR}/lib" \
        MYLIBS="-lreadline -lncurses"

    sudo make linux INSTALL_TOP=${LUA_INSTALL_DIR} \
        MYCFLAGS="-fPIC -I${READLINE_INSTALL_DIR}/include" \
        MYLDFLAGS="-L${READLINE_INSTALL_DIR}/lib -L${NCURSES_INSTALL_DIR}/lib" \
        MYLIBS="-lreadline -lncurses" install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
