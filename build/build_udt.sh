#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

ar=`arch`

if [ "${ar}"x = "x86_64"x ]; then
    echo "x86_64"
    ARCH="AMD64"
elif [ "${ar}"x = "i686"x ]; then
    echo "i686"
    ARCH="IA64"
elif [ "${ar}"x = "i386"x ]; then
    echo "i386"
    ARCH="IA32"
fi

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libudt..."

cd ${LIBUDT_SRC_DIR}

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -e os=LINUX arch=${ARCH}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -e os=LINUX arch=${ARCH}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

if [ ! -d ${LIBUDT_INSTALL_DIR}/include ]; then
    sudo mkdir -p ${LIBUDT_INSTALL_DIR}/include
fi

if [ ! -d ${LIBUDT_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${LIBUDT_INSTALL_DIR}/lib
fi

sudo cp -f ./src/udt.h ${LIBUDT_INSTALL_DIR}/include/
sudo cp -f ./src/libudt.a ${LIBUDT_INSTALL_DIR}/lib/
sudo cp -f ./src/libudt.so ${LIBUDT_INSTALL_DIR}/lib/
