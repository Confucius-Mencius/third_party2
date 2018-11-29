#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build boost..."

cd ${BOOST_SRC_DIR}

chmod +x ./bootstrap.sh
./bootstrap.sh --prefix=${BOOST_INSTALL_DIR}

# ./b2 --help

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    sudo ./b2 -j ${LOGIC_CPU_COUNT} --prefix=${BOOST_INSTALL_DIR} variant=debug link=shared runtime-link=shared threading=multi cflags="-g -ggdb" cxxflags="-g -ggdb" --without-log --without-python install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    sudo ./b2 -j ${LOGIC_CPU_COUNT} --prefix=${BOOST_INSTALL_DIR} variant=release link=shared runtime-link=shared threading=multi cflags="-g -ggdb" cxxflags="-g -ggdb" --without-log --without-python install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
