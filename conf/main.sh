#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

if [ $# == 0 ]; then
    echo "usage: ${SCRIPT_PATH}/main.sh <third party install prefix, eg: /opt/third_party >"
    exit 1
fi

CSV_FILE_PATH=${SCRIPT_PATH}/third_party.csv
OUTPUT_DIR=${SCRIPT_PATH}/output
INSTALL_PREFIX=$1

python ${SCRIPT_PATH}/main.py ${CSV_FILE_PATH} ${OUTPUT_DIR} ${INSTALL_PREFIX}

cp -rf ${OUTPUT_DIR}/common_define.sh ${SCRIPT_PATH}/../build/
cp -rf ${OUTPUT_DIR}/common_define.cmake ${SCRIPT_PATH}/../cmake/

cp -rf ${SCRIPT_PATH}/../cmake ${SCRIPT_PATH}/../../common_component/third_party/
cp -rf ${SCRIPT_PATH}/../cmake ${SCRIPT_PATH}/../../demo_proj/src/third_party/
cp -rf ${SCRIPT_PATH}/../cmake ${SCRIPT_PATH}/../../perf_test_proj/src/third_party/
