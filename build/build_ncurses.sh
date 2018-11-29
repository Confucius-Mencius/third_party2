#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build ncurses..."

cd ${NCURSES_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${NCURSES_INSTALL_DIR} --with-shared
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${NCURSES_INSTALL_DIR} --with-shared
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

# cp -f ${PATCH_DIR}/${NCURSES_BASENAME}/ncurses/base/MKlib_gen.sh ./ncurses/base/

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install
