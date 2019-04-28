#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build image magick..."

cd ${IMAGE_MAGICK_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${IMAGE_MAGICK_INSTALL_DIR} \
        PKG_CONFIG_PATH=${LIBXML2_INSTALL_DIR}/lib/pkgconfig:${LIBPNG_INSTALL_DIR}/lib/pkgconfig:${LIBTIFF_INSTALL_DIR}/lib/pkgconfig:${LIBJPEG_INSTALL_DIR}/lib/pkgconfig:${FREETYPE_INSTALL_DIR}/lib/pkgconfig:${ZLIB_INSTALL_DIR}/lib/pkgconfig \
        CFLAGS="-O0"
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${IMAGE_MAGICK_INSTALL_DIR} \
        PKG_CONFIG_PATH=${LIBXML2_INSTALL_DIR}/lib/pkgconfig:${LIBPNG_INSTALL_DIR}/lib/pkgconfig:${LIBTIFF_INSTALL_DIR}/lib/pkgconfig:${LIBJPEG_INSTALL_DIR}/lib/pkgconfig:${FREETYPE_INSTALL_DIR}/lib/pkgconfig:${ZLIB_INSTALL_DIR}/lib/pkgconfig
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
