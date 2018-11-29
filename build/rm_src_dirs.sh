#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/common.sh

for i in ${SRC_DIR_LIST[@]}; do
    rm -rf ${i}
done

rm -rf ${ARCHIVES_DIR}/tmp

# 删除当前目录中的子目录
# find . -maxdepth 1 -type d | xargs sudo rm -rf
