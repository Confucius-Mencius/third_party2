#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build ffmpeg..."

cd ${FFMPEG_SRC_DIR}

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${FFMPEG_INSTALL_DIR} --enable-shared --enable-libx264 --enable-gpl --enable-libfdk-aac --enable-nonfree \
        --enable-debug=3 --disable-optimizations --disable-asm --disable-stripping \
        --extra-cflags="-I${FDK_AAC_INSTALL_DIR}/include -I${X264_INSTALL_DIR}/include" \
        --extra-ldflags="-L${FDK_AAC_INSTALL_DIR}/lib -L${X264_INSTALL_DIR}/lib"
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${FFMPEG_INSTALL_DIR} --enable-shared --enable-libx264 --enable-gpl --enable-libfdk-aac --enable-nonfree \
        --extra-cflags="-I${FDK_AAC_INSTALL_DIR}/include -I${X264_INSTALL_DIR}/include" \
        --extra-ldflags="-L${FDK_AAC_INSTALL_DIR}/lib -L${X264_INSTALL_DIR}/lib"
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# 运行
# cd /opt/third_party/release/ffmpeg/bin
# export LD_LIBRARY_PATH=../lib:../../fdk_aac/lib:../../x264/lib
# ./ffmpeg --help
