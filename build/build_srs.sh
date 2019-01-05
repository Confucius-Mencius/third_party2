#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build srs..."

cd ${SRS_SRC_DIR}/trunk

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    CFLAGS=-Wno-implicit-fallthrough ./configure --prefix=${SRS_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${SRS_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean

cp ./objs/nginx/html/crossdomain.xml ./research/api-server/static-dir/

make -j ${LOGIC_CPU_COUNT}
sudo make install

# srs installed, to link and start srs:
sudo ln -sf ${SRS_INSTALL_DIR}/etc/init.d/srs /etc/init.d/srs
#/etc/init.d/srs start
