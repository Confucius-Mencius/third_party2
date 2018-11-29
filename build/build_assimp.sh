#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build assimp..."

# todo 删除安装目录下的文件
# sudo rm -rf ${ASSIMP_INSTALL_DIR}/*

cd ${ASSIMP_SRC_DIR}
cp -f ${PATCH_DIR}/${ASSIMP_BASENAME}/CMakeLists.txt ./

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${ASSIMP_INSTALL_DIR} -DASSIMP_BUILD_ZLIB=ON.

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
