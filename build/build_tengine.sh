#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build tengine..."

cd ${JEMALLOC_SRC_DIR}
chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

# 修改${TENGINE_SRC_DIR}/auto/cc/conf文件中的ngx_compile_opt，为：ngx_compile_opt="-c -g"，增加调试符号
sed -i "s/ngx_compile_opt=\"-c\"/ngx_compile_opt=\"-c -g\"/g" ${TENGINE_SRC_DIR}/auto/cc/conf

# https://github.com/yaoweibin/nginx_tcp_proxy_module
# cd ${TENGINE_SRC_DIR}/../
# unzip -f nginx_tcp_proxy_module-master.zip
# TCP_PROXY_MODULE_SRC_DIR=${TENGINE_SRC_DIR}/../nginx_tcp_proxy_module-master

# cd ${TENGINE_SRC_DIR}
# patch -p1 < ${TCP_PROXY_MODULE_SRC_DIR}/tcp_1_8.patch

# 拷贝一份新的openssl并解压
cd ${TENGINE_SRC_DIR}/..

if [ -d tmp/tengine_pcre ]; then
    rm -rf tmp/tengine_pcre
fi

mkdir -p tmp/tengine_pcre

if [ -d tmp/tengine_zlib ]; then
    rm -rf tmp/tengine_zlib
fi

mkdir -p tmp/tengine_zlib

if [ -d tmp/tengine_openssl ]; then
    rm -rf tmp/tengine_openssl
fi

mkdir -p tmp/tengine_openssl

cd ${TENGINE_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${PCRE_BASENAME}.tar.gz tmp/tengine_pcre/
tar -C tmp/tengine_pcre -xvf ${PCRE_BASENAME}.tar.gz

cd ${TENGINE_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${ZLIB_BASENAME}.tar.gz tmp/tengine_zlib/
tar -C tmp/tengine_zlib -xvf ${ZLIB_BASENAME}.tar.gz

cd ${TENGINE_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz tmp/tengine_openssl/
tar -C tmp/tengine_openssl -xvf ${OPENSSL_BASENAME}.tar.gz

cd ${TENGINE_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --with-debug --prefix=${TENGINE_INSTALL_DIR} --with-cc-opt="-Wno-deprecated-declarations -Wno-unused-variable -Wno-implicit-function-declaration" \
        --with-pcre=${TENGINE_SRC_DIR}/../tmp/tengine_pcre/${PCRE_BASENAME} \
        --with-zlib=${TENGINE_SRC_DIR}/../tmp/tengine_zlib/${ZLIB_BASENAME} \
        --with-openssl=${TENGINE_SRC_DIR}/../tmp/tengine_openssl/${OPENSSL_BASENAME} \
        --with-jemalloc=${JEMALLOC_SRC_DIR} --group=www --user=www \
        --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module #--add-module=${TCP_PROXY_MODULE_SRC_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --with-debug --prefix=${TENGINE_INSTALL_DIR} --with-cc-opt="-Wno-deprecated-declarations -Wno-unused-variable -Wno-implicit-function-declaration" \
        --with-pcre=${TENGINE_SRC_DIR}/../tmp/tengine_pcre/${PCRE_BASENAME} \
        --with-zlib=${TENGINE_SRC_DIR}/../tmp/tengine_zlib/${ZLIB_BASENAME} \
        --with-openssl=${TENGINE_SRC_DIR}/../tmp/tengine_openssl/${OPENSSL_BASENAME} \
        --with-jemalloc=${JEMALLOC_SRC_DIR} --group=www --user=www \
        --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module #--add-module=${TCP_PROXY_MODULE_SRC_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

sudo sed -i "s#/bin/sh#/bin/bash#" ${TENGINE_INSTALL_DIR}/sbin/dso_tool

# create 'www' group and 'www' user
GROUP=www
USER=www

#create group if not exists
grep "^${GROUP}" /etc/group >& /dev/null
if [ $? -ne 0 ]; then
    sudo /usr/sbin/groupadd ${GROUP}
fi

#create user if not exists
grep "^${USER}" /etc/passwd >& /dev/null
if [ $? -ne 0 ]; then
    sudo /usr/sbin/useradd -g ${GROUP} ${USER}
fi
