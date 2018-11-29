#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build gflags..."

cd ${GFLAGS_SRC_DIR}

sed -i -e 's!set(CMAKE_DEBUG_POSTFIX "_debug")!#set(CMAKE_DEBUG_POSTFIX "_debug")!' ./CMakeLists.txt

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=${GFLAGS_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}

if [ ! -d ${GFLAGS_INSTALL_DIR} ]; then
    sudo mkdir -p ${GFLAGS_INSTALL_DIR}
fi

sudo cp -rf ./include ${GFLAGS_INSTALL_DIR}/
sudo cp -rf ./lib ${GFLAGS_INSTALL_DIR}/
