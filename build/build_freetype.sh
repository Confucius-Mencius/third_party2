#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build freetype..."

cd ${FREETYPE_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${FREETYPE_INSTALL_DIR} \
        ZLIB_CFLAGS=-I${ZLIB_INSTALL_DIR}/include ZLIB_LIBS="-L${ZLIB_INSTALL_DIR}/lib -lz" \
        LIBPNG_CFLAGS=-I${LIBPNG_INSTALL_DIR}/include LIBPNG_LIBS="-L${LIBPNG_INSTALL_DIR}/lib -lpng"
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${FREETYPE_INSTALL_DIR} \
        ZLIB_CFLAGS=-I${ZLIB_INSTALL_DIR}/include ZLIB_LIBS="-L${ZLIB_INSTALL_DIR}/lib -lz" \
        LIBPNG_CFLAGS=-I${LIBPNG_INSTALL_DIR}/include LIBPNG_LIBS="-L${LIBPNG_INSTALL_DIR}/lib -lpng"
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
