#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# X264和FFmpeg使用汇编提高性能。

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/common.sh

echo "build nasm..."

cd ${NASM_SRC_DIR}

chmod +x ./configure
./configure --prefix=/usr

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
