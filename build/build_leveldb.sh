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

/usr/bin/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE_VALUE} -DCMAKE_INSTALL_PREFIX=${LEVELDB_INSTALL_DIR} -DBUILD_SHARED_LIBS=ON .

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
