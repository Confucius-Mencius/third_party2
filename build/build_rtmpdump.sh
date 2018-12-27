#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build rtmpdump..."

cd ${RTMPDUMP_SRC_DIR}

sed -i -e "s!LIBZ=-lz!LIBZ=-L${ZLIB_INSTALL_DIR}/lib -lz!" ${RTMPDUMP_SRC_DIR}/Makefile
sed -i -e "s!LIBZ=-lz!LIBZ=-L${ZLIB_INSTALL_DIR}/lib -lz!" ${RTMPDUMP_SRC_DIR}/librtmp/Makefile

sed -i -e "s!LIB_OPENSSL=-lssl -lcrypto!LIB_OPENSSL=-L${OPENSSL_INSTALL_DIR}/lib -lssl -L${OPENSSL_INSTALL_DIR}/lib -lcrypto!" ${RTMPDUMP_SRC_DIR}/Makefile
sed -i -e "s!LIB_OPENSSL=-lssl -lcrypto!LIB_OPENSSL=-L${OPENSSL_INSTALL_DIR}/lib -lssl -L${OPENSSL_INSTALL_DIR}/lib -lcrypto!" ${RTMPDUMP_SRC_DIR}/librtmp/Makefile

make clean

if [ ! -d ${RTMPDUMP_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${RTMPDUMP_INSTALL_DIR}/lib
fi

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${RTMPDUMP_INSTALL_DIR} all
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${RTMPDUMP_INSTALL_DIR} install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT} prefix=${RTMPDUMP_INSTALL_DIR} all
    sudo make -j ${LOGIC_CPU_COUNT} prefix=${RTMPDUMP_INSTALL_DIR} install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
