#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build glog..."

cd ${GLOG_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${GLOG_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
