#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build image magick..."

cd ${IMAGE_MAGICK_SRC_DIR}

# export LD_LIBRARY_PATH=${LIBPNG_INSTALL_DIR}/lib:${LIBTIFF_INSTALL_DIR}/lib:${LIBJPEG_INSTALL_DIR}/lib:${FREE_TYPE_INSTALL_DIR}/lib:$LD_LIBRARY_PATH

chmod +x ./configure

# CPPFLAGS="-I${LIBPNG_INSTALL_DIR}/include -I${LIBTIFF_INSTALL_DIR}/include -I${LIBJPEG_INSTALL_DIR}/include -I${FREE_TYPE_INSTALL_DIR}/include -I${ZLIB_INSTALL_DIR}/include" \
# LDFLAGS="-L${LIBPNG_INSTALL_DIR}/lib -L${LIBTIFF_INSTALL_DIR}/lib -L${LIBJPEG_INSTALL_DIR}/lib -L${FREE_TYPE_INSTALL_DIR}/lib -L${ZLIB_INSTALL_DIR}/lib" \
# LIBS="-lpng -ltiff -ljpeg -lfreetype -lz"

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    PKG_CONFIG_PATH=${LIBPNG_INSTALL_DIR}/lib/pkgconfig:${LIBTIFF_INSTALL_DIR}/lib/pkgconfig:${LIBJPEG_INSTALL_DIR}/lib/pkgconfig:${FREE_TYPE_INSTALL_DIR}/lib/pkgconfig:${ZLIB_INSTALL_DIR}/lib/pkgconfig ./configure --prefix=${IMAGE_MAGICK_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    PKG_CONFIG_PATH=${LIBPNG_INSTALL_DIR}/lib/pkgconfig:${LIBTIFF_INSTALL_DIR}/lib/pkgconfig:${LIBJPEG_INSTALL_DIR}/lib/pkgconfig:${FREE_TYPE_INSTALL_DIR}/lib/pkgconfig:${ZLIB_INSTALL_DIR}/lib/pkgconfig ./configure --prefix=${IMAGE_MAGICK_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
