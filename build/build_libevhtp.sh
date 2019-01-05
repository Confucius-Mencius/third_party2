#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libevhtp..."

cd ${LIBEVHTP_SRC_DIR}

# 设置find_path和find_library时的路径：-DCMAKE_INCLUDE_PATH=${LIBBSON_INSTALL_DIR}/include -DCMAKE_LIBRARY_PATH=${LIBBSON_INSTALL_DIR}/lib，或者用CMAKE_PREFIX_PATH
/usr/bin/cmake -v -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${LIBEVHTP_INSTALL_DIR} -DEVHTP_BUILD_SHARED=ON -DEVHTP_USE_DEFER_ACCEPT=ON \
    -DEVHTP_DISABLE_SSL=ON -DCMAKE_PREFIX_PATH="${LIBEVENT_INSTALL_DIR};${OPENSSL_INSTALL_DIR}" .

make clean
make -j ${LOGIC_CPU_COUNT}; make -j ${LOGIC_CPU_COUNT} examples
sudo make install
