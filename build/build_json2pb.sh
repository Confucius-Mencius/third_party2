#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build json2pb..."

cd ${JSON2PB_SRC_DIR}
cp -f ${PATCH_DIR}/${JSON2PB_BASENAME}/Makefile ./

if [ ! -d ${JSON2PB_INSTALL_DIR}/include ]; then
    mkdir -p ${JSON2PB_INSTALL_DIR}/include
fi

if [ ! -d ${JSON2PB_INSTALL_DIR}/lib ]; then
    mkdir -p ${JSON2PB_INSTALL_DIR}/lib
fi

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

sudo make install
