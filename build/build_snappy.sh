#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build snappy..."

cd ${SNAPPY_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=${SNAPPY_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
