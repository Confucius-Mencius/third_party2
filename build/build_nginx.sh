#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build nginx..."

cd ${JEMALLOC_SRC_DIR}
chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

# 修改${NGINX_SRC_DIR}/auto/cc/conf文件中的ngx_compile_opt，为：ngx_compile_opt="-c -g"，增加调试符号
sed -i -e "s/ngx_compile_opt=\"-c\"/ngx_compile_opt=\"-c -g\"/g" ${NGINX_SRC_DIR}/auto/cc/conf

# https://github.com/yaoweibin/nginx_tcp_proxy_module
# cd ${NGINX_SRC_DIR}/../
# unzip -f nginx_tcp_proxy_module-master.zip
# TCP_PROXY_MODULE_SRC_DIR=${NGINX_SRC_DIR}/../nginx_tcp_proxy_module-master

# cd ${NGINX_SRC_DIR}
# patch -p1 < ${TCP_PROXY_MODULE_SRC_DIR}/tcp_1_8.patch

# 拷贝一份新的openssl并解压
cd ${NGINX_SRC_DIR}/..

if [ -d tmp/nginx_pcre ]; then
    rm -rf tmp/nginx_pcre
fi

if [ -d tmp/nginx_zlib ]; then
    rm -rf tmp/nginx_zlib
fi

if [ -d tmp/nginx_openssl ]; then
    rm -rf tmp/nginx_openssl
fi

mkdir -p tmp/nginx_pcre
mkdir -p tmp/nginx_zlib
mkdir -p tmp/nginx_openssl

cd ${NGINX_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${PCRE_BASENAME}.tar.gz tmp/nginx_pcre/
tar -C tmp/nginx_pcre -xvf ${PCRE_BASENAME}.tar.gz

cd ${NGINX_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${ZLIB_BASENAME}.tar.gz tmp/nginx_zlib/
tar -C tmp/nginx_zlib -xvf ${ZLIB_BASENAME}.tar.gz

cd ${NGINX_SRC_DIR}/..
cp -f ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz tmp/nginx_openssl/
tar -C tmp/nginx_openssl -xvf ${OPENSSL_BASENAME}.tar.gz

cd ${NGINX_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --with-debug --prefix=${NGINX_INSTALL_DIR} --with-pcre=${NGINX_SRC_DIR}/../tmp/nginx_pcre/${PCRE_BASENAME} \
        --with-zlib=${NGINX_SRC_DIR}/../tmp/nginx_zlib/${ZLIB_BASENAME} \
        --with-openssl=${NGINX_SRC_DIR}/../tmp/nginx_openssl/${OPENSSL_BASENAME} \
        --user=nginx --group=nginx --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module --with-http_addition_module \
        --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module \
        --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_auth_request_module \
        --with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-file-aio --with-http_v2_module --with-ipv6  
        # --with-threads: 在NGINX 1.7.11中引入了线程池，当工作进程需要执行一个潜在的长操作时，工作进程不再自己执行这个操作，而是将任务放到线程池队列中，任何空闲的线程都可以从队列中获取并执行这个任务。
        # 目前，卸载到线程池中执行的两个基本操作是大多数操作系统中的read()系统调用和Linux中的sendfile()。
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --with-debug --prefix=${NGINX_INSTALL_DIR} --with-pcre=${NGINX_SRC_DIR}/../tmp/nginx_pcre/${PCRE_BASENAME} \
        --with-zlib=${NGINX_SRC_DIR}/../tmp/nginx_zlib/${ZLIB_BASENAME} \
        --with-openssl=${NGINX_SRC_DIR}/../tmp/nginx_openssl/${OPENSSL_BASENAME} \
        --user=nginx --group=nginx --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module --with-http_addition_module \
        --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module \
        --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_auth_request_module \
        --with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-file-aio --with-http_v2_module --with-ipv6  
        # --with-threads: 在NGINX 1.7.11中引入了线程池，当工作进程需要执行一个潜在的长操作时，工作进程不再自己执行这个操作，而是将任务放到线程池队列中，任何空闲的线程都可以从队列中获取并执行这个任务。
        # 目前，卸载到线程池中执行的两个基本操作是大多数操作系统中的read()系统调用和Linux中的sendfile()。
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# create 'nginx' group and 'nginx' user
GROUP=nginx
USER=nginx

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
