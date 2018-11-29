#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build swig..."

cd ${SWIG_SRC_DIR}

cp ${ARCHIVES_DIR}/${PCRE_BASENAME}.tar.gz ./
./Tools/pcre-build.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${SWIG_INSTALL_DIR} --with-lua=${LUA_INSTALL_DIR}/bin/ --with-luaincl=${LUA_INSTALL_DIR}/include/ --with-lualib=${LUA_INSTALL_DIR}/lib/
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${SWIG_INSTALL_DIR} --with-lua=${LUA_INSTALL_DIR}/bin/ --with-luaincl=${LUA_INSTALL_DIR}/include/ --with-lualib=${LUA_INSTALL_DIR}/lib/
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean    
make -j ${LOGIC_CPU_COUNT}
sudo make install
