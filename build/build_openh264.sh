#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build openh264..."

cd ${OPENH264_SRC_DIR}

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j PREFIX=${OPENH264_INSTALL_DIR} ARCH=x86_64 DEBUGSYMBOLS=True BUILDTYPE=Debug
    sudo make -j PREFIX=${OPENH264_INSTALL_DIR} ARCH=x86_64 DEBUGSYMBOLS=True BUILDTYPE=Debug install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j PREFIX=${OPENH264_INSTALL_DIR} ARCH=x86_64 BUILDTYPE=Release
    sudo make -j PREFIX=${OPENH264_INSTALL_DIR} ARCH=x86_64 BUILDTYPE=Release install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
