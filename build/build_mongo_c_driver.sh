#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mongo c driver..."

cd ${MONGO_C_DRIVER_SRC_DIR}

# 设置find_path和find_library时的路径：-DCMAKE_INCLUDE_PATH=${LIBBSON_INSTALL_DIR}/include -DCMAKE_LIBRARY_PATH=${LIBBSON_INSTALL_DIR}/lib，或者用CMAKE_PREFIX_PATH
/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${MONGO_C_DRIVER_INSTALL_DIR} -DENABLE_SSL=OPENSSL -DENABLE_SASL=OFF \
    -DCMAKE_PREFIX_PATH="${LIBBSON_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" .

make clean    
make -j ${LOGIC_CPU_COUNT}
sudo make install
