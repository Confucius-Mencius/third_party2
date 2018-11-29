#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libtiff..."

cd ${LIBTIFF_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${LIBTIFF_INSTALL_DIR} --with-jpeg-include-dir=${LIBJPEG_INSTALL_DIR}/include --with-jpeg-lib-dir=${LIBJPEG_INSTALL_DIR}/lib
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${LIBTIFF_INSTALL_DIR} --with-jpeg-include-dir=${LIBJPEG_INSTALL_DIR}/include --with-jpeg-lib-dir=${LIBJPEG_INSTALL_DIR}/lib
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
