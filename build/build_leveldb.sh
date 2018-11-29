# make -j 4 OPT="-O2 -DNDEBUG" PLATFORM_LDFLAGS= PLATFORM_LIBS

#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build leveldb..."

cd ${LEVELDB_SRC_DIR}

make clean

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    make -j ${LOGIC_CPU_COUNT}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    make -j ${LOGIC_CPU_COUNT}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

if [ ! -d ${LEVELDB_INSTALL_DIR} ]; then
    sudo mkdir -p ${LEVELDB_INSTALL_DIR}
fi

if [ ! -d ${LEVELDB_INSTALL_DIR}/lib ]; then
    sudo mkdir -p ${LEVELDB_INSTALL_DIR}/lib
fi

sudo cp -rf include ${LEVELDB_INSTALL_DIR}/
sudo cp -d -f out-shared/lib*.so* ${LEVELDB_INSTALL_DIR}/lib/
sudo cp -f out-static/lib*.a ${LEVELDB_INSTALL_DIR}/lib/
