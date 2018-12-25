#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build fdk aac..."

cd ${FDK_AAC_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${FDK_AAC_INSTALL_DIR} --enable-shared
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${FDK_AAC_INSTALL_DIR} --enable-shared
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
