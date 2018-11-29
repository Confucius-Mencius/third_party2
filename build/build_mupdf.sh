#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mupdf..."

cd ${MUPDF_SRC_DIR}

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${MUPDF_INSTALL_DIR} build=debug OUT=build/debug USE_SYSTEM_LIBS=no
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${MUPDF_INSTALL_DIR} build=debug OUT=build/debug USE_SYSTEM_LIBS=no install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${MUPDF_INSTALL_DIR} build=release OUT=build/release USE_SYSTEM_LIBS=no
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${MUPDF_INSTALL_DIR} build=release OUT=build/release USE_SYSTEM_LIBS=no install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
