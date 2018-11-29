#!/bin/bash -x

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build fcgi..."

cd ${FCGI_SRC_DIR}
cp -f ${PATCH_DIR}/${FCGI_BASENAME}/include/fcgio.h ./include/

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${FCGI_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${FCGI_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

# make -j ${LOGIC_CPU_COUNT} # 用多任务编译时，到了编译examples的时候报错
make clean
make
sudo make install
