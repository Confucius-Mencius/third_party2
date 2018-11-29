#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build flatbuf..."

cd ${FLATBUF_SRC_DIR}

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DFLATBUFFERS_BUILD_SHAREDLIB=ON -DCMAKE_INSTALL_PREFIX=${FLATBUF_INSTALL_DIR} .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

if [ ! -d ${FLATBUF_INSTALL_DIR}/bin ]; then
    sudo mkdir -p ${FLATBUF_INSTALL_DIR}/bin
fi

sudo cp -f ./flatc ${FLATBUF_INSTALL_DIR}/bin/
