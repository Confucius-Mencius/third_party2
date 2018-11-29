#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

# sudo ldconfig -f /etc/ld.so.conf
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LIBEVENT_INSTALL_DIR}/lib:${OPENSSL_INSTALL_DIR}/lib:${BOOST_INSTALL_DIR}/lib:/usr/lib:/usr/local/lib

echo "build thrift..."

cd ${THRIFT_SRC_DIR}

# 0.9.3版本需要
# chmod +x ./bootstrap.sh
# ACLOCAL_PATH=/usr/share/aclocal ./bootstrap.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CXXFLAGS='-g -O2' CFLAGS='-g -O2' \
    ./configure --prefix=${THRIFT_INSTALL_DIR} --with-qt4=no --with-qt5=no --with-csharp=no --with-java=no --with-erlang=no \
        --with-nodejs=no --with-lua=no --with-python=no --with-perl=no --with-php=no --with-php_extension=no --with-ruby=no \
        --with-haskell=no --with-go=no --with-haxe=no --with-d=no --with-libevent=${LIBEVENT_INSTALL_DIR} --with-boost=${BOOST_INSTALL_DIR} \
        --with-openssl=${OPENSSL_INSTALL_DIR} --enable-tests=no --enable-plugin=no
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    CXXFLAGS='-g -O2' CFLAGS='-g -O2' \
    ./configure --prefix=${THRIFT_INSTALL_DIR} --with-qt4=no --with-qt5=no --with-csharp=no --with-java=no --with-erlang=no \
        --with-nodejs=no --with-lua=no --with-python=no --with-perl=no --with-php=no --with-php_extension=no --with-ruby=no \
        --with-haskell=no --with-go=no --with-haxe=no --with-d=no --with-libevent=${LIBEVENT_INSTALL_DIR} --with-boost=${BOOST_INSTALL_DIR} \
        --with-openssl=${OPENSSL_INSTALL_DIR} --enable-tests=no --enable-plugin=no
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

# 文本替换(centos下)
# if [ $(command -v yum) ]; then
    # sed -i -e 's!#define HAVE_MALLOC 0!#define HAVE_MALLOC 1!' ${THRIFT_SRC_DIR}/config.h
    # sed -i -e 's!#define HAVE_REALLOC 0!#define HAVE_REALLOC 1!' ${THRIFT_SRC_DIR}/config.h
    # sed -i -e 's!#define malloc rpl_malloc!/*#define malloc rpl_malloc*/!' ${THRIFT_SRC_DIR}/config.h
    # sed -i -e 's!#define realloc rpl_realloc!/*#define realloc rpl_realloc*/!' ${THRIFT_SRC_DIR}/config.h

    # sed -i -e 's!#define HAVE_MALLOC 0!#define HAVE_MALLOC 1!' ${THRIFT_SRC_DIR}/lib/cpp/src/thrift/config.h
    # sed -i -e 's!#define HAVE_REALLOC 0!#define HAVE_REALLOC 1!' ${THRIFT_SRC_DIR}/lib/cpp/src/thrift/config.h
    # sed -i -e 's!#define malloc rpl_malloc!/*#define malloc rpl_malloc*/!' ${THRIFT_SRC_DIR}/lib/cpp/src/thrift/config.h
    # sed -i -e 's!#define realloc rpl_realloc!/*#define realloc rpl_realloc*/!' ${THRIFT_SRC_DIR}/lib/cpp/src/thrift/config.h
# fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
