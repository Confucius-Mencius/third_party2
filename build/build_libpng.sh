#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libpng..."

cd ${LIBPNG_SRC_DIR}

# chmod +x ./configure
# CFLAGS="-I${ZLIB_INSTALL_DIR}/include" LDFLAGS="-L${ZLIB_INSTALL_DIR}/lib" ./configure --prefix=${LIBPNG_INSTALL_DIR}

# 原始的makefile.linux在scripts目录下
cp -f ./scripts/makefile.linux ./

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${LIBPNG_INSTALL_DIR} ZLIBLIB=${ZLIB_INSTALL_DIR}/lib ZLIBINC=${ZLIB_INSTALL_DIR}/include -f makefile.linux
    sudo make prefix=${LIBPNG_INSTALL_DIR} ZLIBLIB=${ZLIB_INSTALL_DIR}/lib ZLIBINC=${ZLIB_INSTALL_DIR}/include -f makefile.linux install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${LIBPNG_INSTALL_DIR} ZLIBLIB=${ZLIB_INSTALL_DIR}/lib ZLIBINC=${ZLIB_INSTALL_DIR}/include -f makefile.linux
    sudo make prefix=${LIBPNG_INSTALL_DIR} ZLIBLIB=${ZLIB_INSTALL_DIR}/lib ZLIBINC=${ZLIB_INSTALL_DIR}/include -f makefile.linux install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
