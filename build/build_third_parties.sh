    bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# if [ "$(id -u)" != "0" ]; then
#     echo "the script must be run as root" 1>&2
#     exit -1
# fi

SCRIPT_PATH=$(cd `dirname $0`; pwd)

chmod +x ${SCRIPT_PATH}/*.sh

. ${SCRIPT_PATH}/build_type.sh
. ${SCRIPT_PATH}/common.sh

function BuildAll
{
    CUR_GCC_VER="$(gcc --version | head -n1 | cut -d" " -f4)"
    CXX11_GCC_VER="4.7"

    echo `date` >build_third_parties_time.txt

    cd ${SCRIPT_PATH}
    ./build_pcre.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build pcre"
        exit 1
    fi
    
    cd ${SCRIPT_PATH}
    ./build_ncurses.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build ncurses"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_readline.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build readline"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_zlib.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build zlib"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_freetype.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build freetype"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_boost.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build boost"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_openssl.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build openssl"
        exit 1
    fi
    
    cd ${SCRIPT_PATH}
    ./build_curl.sh $1 # 依赖openssl
    if [ $? -ne 0 ]; then
        echo "failed to build curl"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gflags.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gflags"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_glog.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build glog"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gtest.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gtest"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libunwind.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libunwind"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_gperftools.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build gperftools"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_exiv2.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build exiv2"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libjpeg.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libjpeg"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libpng.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libpng"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libtiff.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libtiff"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_image_magick.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build image magick"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_rapidjson.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build rapidjson"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_jsoncpp.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build jsoncpp"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libevent.sh $1 # 依赖openssl
    if [ $? -ne 0 ]; then
        echo "failed to build libevent"
        exit 1
    fi

    ./build_libevhtp.sh $1 # 依赖libevent
    if [ $? -ne 0 ]; then
        echo "failed to build libevhtp"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libmagic.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libmagic"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libuuid.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libuuid"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libxml2.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libxml2"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_log4cplus.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build log4cplus"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_snappy.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build snappy"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_protobuf.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build protobuf"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_msgpack.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build msgpack"
        exit 1
    fi

    if [ "$(printf "$CXX11_GCC_VER\n$CUR_GCC_VER" | sort -V | head -n1)" == "$CUR_GCC_VER" ] && [ "$CUR_GCC_VER" != "$CXX11_GCC_VER" ]; then 
        echo "current gcc version: $CUR_GCC_VER, less than $CXX11_GCC_VER, so don't build flatbuf"
    else
        cd ${SCRIPT_PATH}
        ./build_flatbuf.sh $1
        if [ $? -ne 0 ]; then
            echo "failed to build flatbuf"
            exit 1
        fi
    fi
    
    cd ${SCRIPT_PATH}
    ./build_thrift.sh $1 # 依赖openssl boost libevent
    if [ $? -ne 0 ]; then
       echo "failed to build thrift"
       exit 1
    fi

    # deprecated
    # cd ${SCRIPT_PATH}
    # ./build_mongo_cxx_driver_legacy.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build mongo cxx driver legacy"
    #     exit 1
    # fi

    cd ${SCRIPT_PATH}
    ./build_libbson.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libbson"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_mongo_c_driver.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build mongo c driver"
        exit 1
    fi

    if [ "$(printf "$CXX11_GCC_VER\n$CUR_GCC_VER" | sort -V | head -n1)" == "$CUR_GCC_VER" ] && [ "$CUR_GCC_VER" != "$CXX11_GCC_VER" ]; then 
        echo "current gcc version: $CUR_GCC_VER, less than $CXX11_GCC_VER, so don't build mongo cxx driver"
    else
        cd ${SCRIPT_PATH}
        ./build_mongo_cxx_driver.sh $1
        if [ $? -ne 0 ]; then
            echo "failed to build mongo cxx driver"
            exit 1
        fi
    fi

    cd ${SCRIPT_PATH}
    ./build_hiredis.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build hiredis"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_redis.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build redis"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_zookeeper.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build zookeeper"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_openpgm.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build openpgm"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_zeromq.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build zeromq"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_lua.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build lua"
        exit 1
    fi

    # deprecated
    # cd ${SCRIPT_PATH}
    # ./build_toluapp.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build toluapp"
    #     exit 1
    # fi

    cd ${SCRIPT_PATH}
    ./build_swig.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build swig"
        exit 1
    fi

    if [ "$(printf "$CXX11_GCC_VER\n$CUR_GCC_VER" | sort -V | head -n1)" == "$CUR_GCC_VER" ] && [ "$CUR_GCC_VER" != "$CXX11_GCC_VER" ]; then 
        echo "current gcc version: $CUR_GCC_VER, less than $CXX11_GCC_VER, so don't build opencc"
    else
        cd ${SCRIPT_PATH}
        ./build_opencc.sh $1
        if [ $? -ne 0 ]; then
            echo "failed to build opencc"
            exit 1
        fi
    fi

    cd ${SCRIPT_PATH}
    ./build_nginx.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build nginx"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_tengine.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build tengine"
        exit 1
    fi

    # cd ${SCRIPT_PATH}
    # ./build_lighttpd.sh $1 # 依赖openssl
    # if [ $? -ne 0 ]; then
    #     echo "failed to build lighttpd"
    #     exit 1
    # fi

    # cd ${SCRIPT_PATH}
    # ./build_spawn_fcgi.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build spawn fcgi"
    #     exit 1
    # fi

    # cd ${SCRIPT_PATH}
    # ./build_fcgi.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build fcgi"
    #     exit 1
    # fi

    cd ${SCRIPT_PATH}
    ./build_mysql_client.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build mysql client"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_udt.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build udt"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_libwebsockets.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build libwebsockets"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_leveldb.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build leveldb"
        exit 1
    fi

    # cd ${SCRIPT_PATH}
    # ./build_mupdf.sh $1
    # if [ $? -ne 0 ]; then
    #     echo "failed to build mupdf"
    #     exit 1
    # fi

    cd ${SCRIPT_PATH}
    ./build_assimp.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build assimp"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_fdk_aac.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build fdk aac"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_x264.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build x264"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_openh264.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build openh264"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_ffmpeg.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build ffmpeg"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_rtmpdump.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build rtmpdump"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_srs.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build srs"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_sdl.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build sdl"
        exit 1
    fi

    cd ${SCRIPT_PATH}
    ./build_spdlog.sh $1
    if [ $? -ne 0 ]; then
        echo "failed to build spdlog"
        exit 1
    fi

    echo `date` >>build_third_parties_time.txt
}

BuildAll ${BUILD_TYPE} 2>build_third_parties.err
