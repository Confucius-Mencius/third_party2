#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

echo "build snappy..."

cd ${SNAPPY_SRC_DIR}

chmod +x ./autogen.sh
ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh

chmod +x ./configure

if [ "${BUILD_TYPE}"x = "debug"x ]; then
    ./configure --prefix=${SNAPPY_INSTALL_DIR}
elif [ "${BUILD_TYPE}"x = "release"x ]; then
    ./configure --prefix=${SNAPPY_INSTALL_DIR}
else
    echo "not supported build type: " ${BUILD_TYPE}
    exit 1
fi
 
make clean   
make -j ${LOGIC_CPU_COUNT}
sudo make install

# 直接运行autogen.sh时报类似错误：
# ./configure: line 16371: syntax error near unexpected token `newline'
# ./configure: line 16371: `  PKG_CHECK_MODULES('

# 原因：
# The PKG_PROG_PKG_CONFIG variable refers to a macro pkg.m4 that is provided as part of the pkg-config package, so the first thing to check is that
# pkg-config is installed and that the macro file is in the default location (and is readable, of course)

# dpkg -l pkg-config

# ls -l /usr/share/aclocal/pkg.m4
# If that checks out, then the question becomes why is aclocal not finding it? You can check where aclocal is configured to look for third-party m4 
# files using the --print-ac-dir switch i.e.

# aclocal --print-ac-dir
# If that's not the same as the location above, it suggests there is a non-standard version of automake on your system - if you can't resolve that, 
# then a possible workaround is to set or export the ACLOCAL_PATH environment variable before running the autogen.sh script e.g.

# 解决方法：
# ACLOCAL_PATH=/usr/share/aclocal ./autogen.sh
# or

# export ACLOCAL_PATH=/usr/share/aclocal
# ./autogen.sh
# ./configure
# See the macro search path section of the GNU automake manual.
