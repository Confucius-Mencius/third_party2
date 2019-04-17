#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh
. ${SCRIPT_PATH}/../../sh_tools/base/version_compare.sh

echo "build log4cplus..."

cd ${LOG4CPLUS_SRC_DIR}

chmod +x ./configure

GCC_VERSION=`gcc -v 2>&1 | tail -1 | awk '{print $3}'` # cat /proc/version | awk '{printf substr($7,1,5)}'
VERSION="4.8.1"

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    if version_ge ${GCC_VERSION} ${VERSION}; then
        echo "${GCC_VERSION} is >= ${VERSION}"
        ./configure --prefix=${LOG4CPLUS_INSTALL_DIR} --enable-debugging CXXFLAGS="-std=c++11"
    else
        echo "${GCC_VERSION} is < ${VERSION}"
        ./configure --prefix=${LOG4CPLUS_INSTALL_DIR}
    fi
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    if version_ge ${GCC_VERSION} ${VERSION}; then
        echo "${GCC_VERSION} is >= ${VERSION}"
        ./configure --prefix=${LOG4CPLUS_INSTALL_DIR} CXXFLAGS="-std=c++11"
    else
        echo "${GCC_VERSION} is < ${VERSION}"
        ./configure --prefix=${LOG4CPLUS_INSTALL_DIR}
    fi
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean

cp -f ${PATCH_DIR}/${LOG4CPLUS_BASENAME}/src/threads.cxx ./src/

make -j ${LOGIC_CPU_COUNT}
sudo make install

if [ ! -d ${LOG4CPLUS_INSTALL_DIR}/bin ]; then
    sudo mkdir -p ${LOG4CPLUS_INSTALL_DIR}/bin
fi

sudo cp -f ${LOG4CPLUS_SRC_DIR}/loggingserver ${LOG4CPLUS_INSTALL_DIR}/bin/
