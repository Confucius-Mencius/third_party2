#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build exiv2..."

cd ${EXIV2_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CXXFLAGS="-g -ggdb -O0" ./configure --prefix=${EXIV2_INSTALL_DIR} --disable-xmp --with-zlib=${ZLIB_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CXXFLAGS="-g -ggdb -O2" ./configure --prefix=${EXIV2_INSTALL_DIR} --disable-xmp --with-zlib=${ZLIB_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
