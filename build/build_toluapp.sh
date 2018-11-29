#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build toluapp..."

cd ${TOLUAPP_SRC_DIR}

cp -f ${PATCH_DIR}/${TOLUAPP_BASENAME}/CMakeLists.txt ./
cp -f ${PATCH_DIR}/${TOLUAPP_BASENAME}/src/CMakeLists.txt ./src/
cp -f ${PATCH_DIR}/${TOLUAPP_BASENAME}/src/bin/CMakeLists.txt ./src/bin/
cp -f ${PATCH_DIR}/${TOLUAPP_BASENAME}/src/lib/CMakeLists.txt ./src/lib/

/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=${TOLUAPP_INSTALL_DIR} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} .

make clean
make -j ${LOGIC_CPU_COUNT}

if [ ! -d ${TOLUAPP_INSTALL_DIR} ]; then
    sudo mkdir -p ${TOLUAPP_INSTALL_DIR}
fi

if [ ! -d ${TOLUAPP_INSTALL_DIR}/include ]; then
    sudo mkdir ${TOLUAPP_INSTALL_DIR}/include
fi

if [ ! -d ${TOLUAPP_INSTALL_DIR}/lib ]; then
    sudo mkdir ${TOLUAPP_INSTALL_DIR}/lib
fi

if [ ! -d ${TOLUAPP_INSTALL_DIR}/bin ]; then
    sudo mkdir ${TOLUAPP_INSTALL_DIR}/bin
fi

sudo cp -f ${TOLUAPP_SRC_DIR}/include/* ${TOLUAPP_INSTALL_DIR}/include/
sudo cp -f ${TOLUAPP_SRC_DIR}/lib/lib* ${TOLUAPP_INSTALL_DIR}/lib/
sudo cp -f ${TOLUAPP_SRC_DIR}/bin/* ${TOLUAPP_INSTALL_DIR}/bin/
