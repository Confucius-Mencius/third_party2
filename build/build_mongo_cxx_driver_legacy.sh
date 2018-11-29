#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build mongo cxx driver legacy..."

cd ${MONGO_CXX_DRIVER_LEGACY_SRC_DIR}

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    sudo scons -j ${LOGIC_CPU_COUNT} --cpppath="${BOOST_INSTALL_DIR}/include" \
        --libpath="${BOOST_INSTALL_DIR}/lib" --runtime-library-search-path="${BOOST_INSTALL_DIR}/lib" \
        --prefix="${MONGO_CXX_DRIVER_LEGACY_INSTALL_DIR}" --sharedclient --debug --disable-warnings-as-errors install
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    sudo scons -j ${LOGIC_CPU_COUNT} --cpppath="${BOOST_INSTALL_DIR}/include" \
        --libpath="${BOOST_INSTALL_DIR}/lib" --runtime-library-search-path="${BOOST_INSTALL_DIR}/lib" \
        --prefix="${MONGO_CXX_DRIVER_LEGACY_INSTALL_DIR}" --sharedclient --release --disable-warnings-as-errors install
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
