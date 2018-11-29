#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mongo cxx driver..."

cd ${MONGO_CXX_DRIVER_SRC_DIR}/build

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${MONGO_CXX_DRIVER_INSTALL_DIR} \
    -DCMAKE_PREFIX_PATH="${MONGO_C_DRIVER_INSTALL_DIR};${LIBBSON_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" ..

make clean
make -j ${LOGIC_CPU_COUNT} EP_mnmlstc_core； make -j ${LOGIC_CPU_COUNT}
sudo make install
