#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build protobuf..."

cd ${PROTOBUF_SRC_DIR}

chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

rm -f src/*.la

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${PROTOBUF_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${PROTOBUF_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi

make clean
make -j ${LOGIC_CPU_COUNT}
sudo make install

# cp -rf include ${LEVELDB_INSTALL_DIR}/
# cp -d -f src/.libs/lib*.so* ${PROTOBUF_INSTALL_DIR}/lib/
# cp -f src/.libs/lib*.a ${PROTOBUF_INSTALL_DIR}/lib/
# cp -f src/.libs/protoc ${PROTOBUF_INSTALL_DIR}/bin/

# 编译python protobuf
cd ${PROTOBUF_SRC_DIR}/python
python setup.py build
sudo python setup.py install

# 拷贝最新版python到测试工程中
rm -rf ${PROTOBUF_SRC_DIR}/../../../demo_proj/py_test/google
rm -rf ${PROTOBUF_SRC_DIR}/../../../perf_test_proj/py_test/google

cp -rf ${PROTOBUF_SRC_DIR}/python/google ${PROTOBUF_SRC_DIR}/../../../demo_proj/py_test/
cp -rf ${PROTOBUF_SRC_DIR}/python/google ${PROTOBUF_SRC_DIR}/../../../perf_test_proj/py_test/
