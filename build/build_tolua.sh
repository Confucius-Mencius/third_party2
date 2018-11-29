#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build tolua..."

cd ${TOLUA_SRC_DIR}

cp -f ${PATCH_DIR}/${TOLUA_BASENAME}/CMakeLists.txt ./
cp -f ${PATCH_DIR}/${TOLUA_BASENAME}/src/bin/CMakeLists.txt ./src/bin/
cp -f ${PATCH_DIR}/${TOLUA_BASENAME}/src/lib/CMakeLists.txt ./src/lib/

/usr/bin/cmake -DCMAKE_INSTALL_PREFIX=${TOLUA_INSTALL_DIR} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} .

make clean
make -j ${LOGIC_CPU_COUNT}

if [ ! -d ${TOLUA_INSTALL_DIR} ]; then
    sudo mkdir -p ${TOLUA_INSTALL_DIR}
fi

if [ ! -d ${TOLUA_INSTALL_DIR}/include ]; then
    sudo mkdir ${TOLUA_INSTALL_DIR}/include
fi

if [ ! -d ${TOLUA_INSTALL_DIR}/lib ]; then
    sudo mkdir ${TOLUA_INSTALL_DIR}/lib
fi

if [ ! -d ${TOLUA_INSTALL_DIR}/bin ]; then
    sudo mkdir ${TOLUA_INSTALL_DIR}/bin
fi

sudo cp -f ${TOLUA_SRC_DIR}/include/tolua.h ${TOLUA_INSTALL_DIR}/include/
sudo cp -f ${TOLUA_SRC_DIR}/lib/libtolua.so ${TOLUA_INSTALL_DIR}/lib/
sudo cp -f ${TOLUA_SRC_DIR}/bin/toluax ${TOLUA_INSTALL_DIR}/bin/
