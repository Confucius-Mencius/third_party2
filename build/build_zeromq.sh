#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build zeromq..."

cd ${ZEROMQ_SRC_DIR}
mv ../${OPENPGM_BASENAME}.tar.gz 

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure pgm_CFLAGS="-I${THIRD_PARTY_INSTALL_PREFIX}/openpgm/include/pgm-5.2" pgm_LIBS="-L${THIRD_PARTY_INSTALL_PREFIX}/openpgm/lib -lpgm" --prefix=${ZEROMQ_INSTALL_DIR} --enable-static=yes --enable-shared=yes --with-pic --with-pgm
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure pgm_CFLAGS="-I${THIRD_PARTY_INSTALL_PREFIX}/openpgm/include/pgm-5.2" pgm_LIBS="-L${THIRD_PARTY_INSTALL_PREFIX}/openpgm/lib -lpgm" --prefix=${ZEROMQ_INSTALL_DIR} --enable-static=yes --enable-shared=yes --with-pic --with-pgm
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# CXXFLAGS='-fno-rtti' for undefined symbol: _ZTVN10__cxxabiv120__si_class_type_infoE(__cxxabiv1::__si_class_type_info)
