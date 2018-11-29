#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/common.sh

echo "build m4..."

cd ${M4_SRC_DIR}

chmod +x ./configure
./configure --prefix=/usr

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
