#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build libwebsockets..."

cd ${LIBWEBSOCKETS_SRC_DIR}

cp -f ${PATCH_DIR}/${LIBWEBSOCKETS_BASENAME}/minimal-examples/http-server/minimal-http-server-eventlib-foreign/CMakeLists.txt ./minimal-examples/http-server/minimal-http-server-eventlib-foreign/CMakeLists.txt

if [ ! -d build ]; then
    mkdir build
fi

cd build

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${LIBWEBSOCKETS_INSTALL_DIR} -DLIB_SUFFIX=64 -DLWS_MAX_SMP=256 \
    -DLWS_WITH_LIBEVENT=ON -DLWS_UNIX_SOCK=ON -DLWS_WITH_HTTP2=ON -DLWS_WITH_MINIMAL_EXAMPLES=ON \
    -DLWS_ZLIB_INCLUDE_DIRS=${ZLIB_INSTALL_DIR}/include \
    -DLWS_ZLIB_LIBRARIES="${ZLIB_INSTALL_DIR}/lib/libz.so" \
    -DLWS_OPENSSL_INCLUDE_DIRS=${OPENSSL_INSTALL_DIR}/include \
    -DLWS_OPENSSL_LIBRARIES="${OPENSSL_INSTALL_DIR}/lib/libssl.so;${OPENSSL_INSTALL_DIR}/lib/libcrypto.so" \
    -DLWS_LIBEVENT_INCLUDE_DIRS=${LIBEVENT_INSTALL_DIR}/include \
    -DLWS_LIBEVENT_LIBRARIES="${LIBEVENT_INSTALL_DIR}/lib/libevent_core.so;${LIBEVENT_INSTALL_DIR}/lib/libevent_extra.so;${LIBEVENT_INSTALL_DIR}/lib/libevent_pthreads.so;${LIBEVENT_INSTALL_DIR}/lib/libevent_openssl.so" ..

make clean    
make -j ${LOGIC_CPU_COUNT}
sudo make install
