#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build spdlog..."

cd ${SPDLOG_SRC_DIR}

if [ ! -d ${SPDLOG_INSTALL_DIR} ]; then
    sudo mkdir -p ${SPDLOG_INSTALL_DIR}
fi

sudo cp -rf include ${SPDLOG_INSTALL_DIR}/
