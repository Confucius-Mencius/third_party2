#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libbson..."

cd ${LIBBSON_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${LIBBSON_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

sudo mv ${LIBBSON_INSTALL_DIR}/include/libbson-1.0 ${LIBBSON_INSTALL_DIR}/include/bson
