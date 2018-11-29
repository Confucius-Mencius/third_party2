#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build librtmp..."

cd ${LIBRTMP_SRC_DIR}

make clean

if [ ! -d ${LIBRTMP_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${LIBRTMP_INSTALL_DIR}/lib
fi

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${LIBRTMP_INSTALL_DIR} all
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${LIBRTMP_INSTALL_DIR} install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${LIBRTMP_INSTALL_DIR} all
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${LIBRTMP_INSTALL_DIR} install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
