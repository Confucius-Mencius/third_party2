#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

THIRD_PARTY_INSTALL_PREFIX=/opt/third_party/${BUILD_TYPE}

M4_BASENAME=m4-1.4.18
AUTOCONF_BASENAME=autoconf-2.69
AUTOMAKE_BASENAME=automake-1.16.1
LIBTOOL_BASENAME=libtool-2.4.6
HELPTOMAN_BASENAME=help2man-1.47.8
BISON_BASENAME=bison-3.2.2
FLEX_BASENAME=flex-2.6.3
CMAKE_BASENAME=cmake-3.13.0
SCONS_BASENAME=scons-3.0.1
BOOST_BASENAME=boost_1_68_0
CURL_BASENAME=curl-7.62.0
ZLIB_BASENAME=zlib-1.2.11
XZ_BASENAME=xz-5.2.4
EXIV2_BASENAME=exiv2-0.26-trunk
FLATBUF_BASENAME=flatbuffers-1.10.0
FREE_TYPE_BASENAME=freetype-2.9.1
GFLAGS_BASENAME=gflags-2.2.2
GLOG_BASENAME=glog-0.3.5
GTEST_BASENAME=googletest-release-1.8.1
GPERFTOOLS_BASENAME=gperftools-2.7
HIREDIS_BASENAME=hiredis-0.14.0
IMAGE_MAGICK_BASENAME=ImageMagick-7.0.8-14
JEMALLOC_BASENAME=jemalloc-5.1.0
JSONCPP_BASENAME=jsoncpp-1.8.4
LIBEVENT_BASENAME=libevent-2.1.8-stable
LIBEVHTP_BASENAME=libevhtp-1.2.16
LIBJPEG_BASENAME=jpegsrc.v9c
LIBMAGIC_BASENAME=libmagic-5.18
LIBPNG_BASENAME=libpng-1.6.35
LIBTIFF_BASENAME=libtiff-Release-v4-0-9
LIBUNWIND_BASENAME=libunwind-1.2.1
LIBUUID_BASENAME=libuuid-1.0.3
LIBXML2_BASENAME=libxml2-2.9.8
LOG4CPLUS_BASENAME=log4cplus-2.0.2
NCURSES_BASENAME=ncurses-6.1
READLINE_BASENAME=readline-7.0
LUA_BASENAME=lua-5.3.5
LIBBSON_BASENAME=libbson-1.9.5
MONGO_C_DRIVER_BASENAME=mongo-c-driver-1.13.0
MONGO_CXX_DRIVER_BASENAME=mongo-cxx-driver-r3.4.0
MSGPACK_BASENAME=msgpack-c-cpp-3.1.1
OPENCC_BASENAME=OpenCC-ver.1.0.5
OPENSSL_BASENAME=openssl-1.0.2q
PCRE_BASENAME=pcre-8.42
PROTOBUF_BASENAME=protobuf-3.6.1
RAPIDJSON_BASENAME=rapidjson-1.1.0
REDIS_BASENAME=redis-5.0.0
SNAPPY_BASENAME=snappy-1.1.7
SWIG_BASENAME=swig-3.0.12
NGINX_BASENAME=nginx-1.14.1
TENGINE_BASENAME=tengine-2.2.3
THRIFT_BASENAME=thrift-0.11.0
ZOOKEEPER_BASENAME=zookeeper-3.4.13
OPENPGM_BASENAME=libpgm-5.2.122
ZEROMQ_BASENAME=zeromq-4.2.5
UDT_BASENAME=udt.sdk.4.11
MYSQL_CLIENT_BASENAME=mysql-5.6.40
LIBWEBSOCKETS_BASENAME=libwebsockets-3.0.1
LEVELDB_BASENAME=leveldb-1.20
MUPDF_BASENAME=mupdf-1.14.0-source
ASSIMP_BASENAME=assimp-4.1.0
FFMPEG_BASENAME=ffmpeg-4.1
ASTYLE_BASENAME=astyle_3.1
SPDLOG_BASENAME=spdlog-1.2.1
RTMPDUMP_BASENAME=rtmpdump-2.4
SRS_BASENAME=srs-2.0-r5
FDK_AAC_BASENAME=fdk-aac-2.0.0
X264_BASENAME=x264
NASM_BASENAME=nasm-2.14.01

M4_SRC_DIR=${ARCHIVES_DIR}/${M4_BASENAME}
AUTOCONF_SRC_DIR=${ARCHIVES_DIR}/${AUTOCONF_BASENAME}
AUTOMAKE_SRC_DIR=${ARCHIVES_DIR}/${AUTOMAKE_BASENAME}
LIBTOOL_SRC_DIR=${ARCHIVES_DIR}/${LIBTOOL_BASENAME}
HELPTOMAN_SRC_DIR=${ARCHIVES_DIR}/${HELPTOMAN_BASENAME}
BISON_SRC_DIR=${ARCHIVES_DIR}/${BISON_BASENAME}
FLEX_SRC_DIR=${ARCHIVES_DIR}/${FLEX_BASENAME}
CMAKE_SRC_DIR=${ARCHIVES_DIR}/${CMAKE_BASENAME}
SCONS_SRC_DIR=${ARCHIVES_DIR}/${SCONS_BASENAME}
BOOST_SRC_DIR=${ARCHIVES_DIR}/${BOOST_BASENAME}
CURL_SRC_DIR=${ARCHIVES_DIR}/${CURL_BASENAME}
ZLIB_SRC_DIR=${ARCHIVES_DIR}/${ZLIB_BASENAME}
XZ_SRC_DIR=${ARCHIVES_DIR}/${XZ_BASENAME}
EXIV2_SRC_DIR=${ARCHIVES_DIR}/${EXIV2_BASENAME}
FLATBUF_SRC_DIR=${ARCHIVES_DIR}/${FLATBUF_BASENAME}
FREE_TYPE_SRC_DIR=${ARCHIVES_DIR}/${FREE_TYPE_BASENAME}
GFLAGS_SRC_DIR=${ARCHIVES_DIR}/${GFLAGS_BASENAME}
GLOG_SRC_DIR=${ARCHIVES_DIR}/${GLOG_BASENAME}
GTEST_SRC_DIR=${ARCHIVES_DIR}/${GTEST_BASENAME}
GPERFTOOLS_SRC_DIR=${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}
HIREDIS_SRC_DIR=${ARCHIVES_DIR}/${HIREDIS_BASENAME}
IMAGE_MAGICK_SRC_DIR=${ARCHIVES_DIR}/${IMAGE_MAGICK_BASENAME}
JEMALLOC_SRC_DIR=${ARCHIVES_DIR}/${JEMALLOC_BASENAME}
JSONCPP_SRC_DIR=${ARCHIVES_DIR}/${JSONCPP_BASENAME}
LIBEVENT_SRC_DIR=${ARCHIVES_DIR}/${LIBEVENT_BASENAME}
LIBEVHTP_SRC_DIR=${ARCHIVES_DIR}/${LIBEVHTP_BASENAME}
LIBJPEG_SRC_DIR=${ARCHIVES_DIR}/${LIBJPEG_BASENAME}
LIBMAGIC_SRC_DIR=${ARCHIVES_DIR}/${LIBMAGIC_BASENAME}
LIBPNG_SRC_DIR=${ARCHIVES_DIR}/${LIBPNG_BASENAME}
LIBTIFF_SRC_DIR=${ARCHIVES_DIR}/${LIBTIFF_BASENAME}
LIBUNWIND_SRC_DIR=${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}
LIBUUID_SRC_DIR=${ARCHIVES_DIR}/${LIBUUID_BASENAME}
LIBXML2_SRC_DIR=${ARCHIVES_DIR}/${LIBXML2_BASENAME}
LOG4CPLUS_SRC_DIR=${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}
NCURSES_SRC_DIR=${ARCHIVES_DIR}/${NCURSES_BASENAME}
READLINE_SRC_DIR=${ARCHIVES_DIR}/${READLINE_BASENAME}
LUA_SRC_DIR=${ARCHIVES_DIR}/${LUA_BASENAME}
LIBBSON_SRC_DIR=${ARCHIVES_DIR}/${LIBBSON_BASENAME}
MONGO_C_DRIVER_SRC_DIR=${ARCHIVES_DIR}/${MONGO_C_DRIVER_BASENAME}
MONGO_CXX_DRIVER_SRC_DIR=${ARCHIVES_DIR}/${MONGO_CXX_DRIVER_BASENAME}
MSGPACK_SRC_DIR=${ARCHIVES_DIR}/${MSGPACK_BASENAME}
OPENCC_SRC_DIR=${ARCHIVES_DIR}/${OPENCC_BASENAME}
OPENSSL_SRC_DIR=${ARCHIVES_DIR}/${OPENSSL_BASENAME}
PCRE_SRC_DIR=${ARCHIVES_DIR}/${PCRE_BASENAME}
PROTOBUF_SRC_DIR=${ARCHIVES_DIR}/${PROTOBUF_BASENAME}
RAPIDJSON_SRC_DIR=${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}
REDIS_SRC_DIR=${ARCHIVES_DIR}/${REDIS_BASENAME}
SNAPPY_SRC_DIR=${ARCHIVES_DIR}/${SNAPPY_BASENAME}
SWIG_SRC_DIR=${ARCHIVES_DIR}/${SWIG_BASENAME}
NGINX_SRC_DIR=${ARCHIVES_DIR}/${NGINX_BASENAME}
TENGINE_SRC_DIR=${ARCHIVES_DIR}/${TENGINE_BASENAME}
THRIFT_SRC_DIR=${ARCHIVES_DIR}/${THRIFT_BASENAME}
ZOOKEEPER_SRC_DIR=${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}
OPENPGM_SRC_DIR=${ARCHIVES_DIR}/${OPENPGM_BASENAME}
ZEROMQ_SRC_DIR=${ARCHIVES_DIR}/${ZEROMQ_BASENAME}
UDT_SRC_DIR=${ARCHIVES_DIR}/${UDT_BASENAME}
MYSQL_CLIENT_SRC_DIR=${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}
LIBWEBSOCKETS_SRC_DIR=${ARCHIVES_DIR}/${LIBWEBSOCKETS_BASENAME}
LEVELDB_SRC_DIR=${ARCHIVES_DIR}/${LEVELDB_BASENAME}
MUPDF_SRC_DIR=${ARCHIVES_DIR}/${MUPDF_BASENAME}
ASSIMP_SRC_DIR=${ARCHIVES_DIR}/${ASSIMP_BASENAME}
FFMPEG_SRC_DIR=${ARCHIVES_DIR}/${FFMPEG_BASENAME}
ASTYLE_SRC_DIR=${ARCHIVES_DIR}/${ASTYLE_BASENAME}
SPDLOG_SRC_DIR=${ARCHIVES_DIR}/${SPDLOG_BASENAME}
RTMPDUMP_SRC_DIR=${ARCHIVES_DIR}/${RTMPDUMP_BASENAME}
SRS_SRC_DIR=${ARCHIVES_DIR}/${SRS_BASENAME}
FDK_AAC_SRC_DIR=${ARCHIVES_DIR}/${FDK_AAC_BASENAME}
X264_SRC_DIR=${ARCHIVES_DIR}/${X264_BASENAME}
NASM_SRC_DIR=${ARCHIVES_DIR}/${NASM_BASENAME}

M4_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/m4
AUTOCONF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/autoconf
AUTOMAKE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/automake
LIBTOOL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libtool
HELPTOMAN_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/helptoman
BISON_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/bison
FLEX_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/flex
CMAKE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/cmake
SCONS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/scons
BOOST_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/boost
CURL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/curl
ZLIB_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/zlib
XZ_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/xz
EXIV2_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/exiv2
FLATBUF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/flatbuf
FREE_TYPE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/free_type
GFLAGS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gflags
GLOG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/glog
GTEST_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gtest
GPERFTOOLS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/gperftools
HIREDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/hiredis
IMAGE_MAGICK_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/image_magick
JEMALLOC_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/jemalloc
JSONCPP_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/jsoncpp
LIBEVENT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libevent
LIBEVHTP_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libevhtp
LIBJPEG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libjpeg
LIBMAGIC_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libmagic
LIBPNG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libpng
LIBTIFF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libtiff
LIBUNWIND_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libunwind
LIBUUID_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libuuid
LIBXML2_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libxml2
LOG4CPLUS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/log4cplus
NCURSES_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/ncurses
READLINE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/readline
LUA_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/lua
LIBBSON_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libbson
MONGO_C_DRIVER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mongo_c_driver
MONGO_CXX_DRIVER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mongo_cxx_driver
MSGPACK_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/msgpack
OPENCC_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/opencc
OPENSSL_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/openssl
PCRE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/pcre
PROTOBUF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/protobuf
RAPIDJSON_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/rapidjson
REDIS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/redis
SNAPPY_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/snappy
SWIG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/swig
NGINX_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/nginx
TENGINE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/tengine
THRIFT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/thrift
ZOOKEEPER_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/zookeeper
OPENPGM_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/openpgm
ZEROMQ_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/zeromq
UDT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/udt
MYSQL_CLIENT_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mysql_client
LIBWEBSOCKETS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/libwebsockets
LEVELDB_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/leveldb
MUPDF_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/mupdf
ASSIMP_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/assimp
FFMPEG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/ffmpeg
ASTYLE_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/astyle
SPDLOG_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/spdlog
RTMPDUMP_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/rtmpdump
SRS_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/srs
FDK_AAC_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/fdk_aac
X264_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/x264
NASM_INSTALL_DIR=${THIRD_PARTY_INSTALL_PREFIX}/nasm

SRC_DIR_LIST=(${M4_SRC_DIR} ${AUTOCONF_SRC_DIR} ${AUTOMAKE_SRC_DIR} ${LIBTOOL_SRC_DIR} ${HELPTOMAN_SRC_DIR} ${BISON_SRC_DIR} ${FLEX_SRC_DIR} ${CMAKE_SRC_DIR} ${SCONS_SRC_DIR} ${BOOST_SRC_DIR} ${CURL_SRC_DIR} ${ZLIB_SRC_DIR} ${XZ_SRC_DIR} ${EXIV2_SRC_DIR} ${FLATBUF_SRC_DIR} ${FREE_TYPE_SRC_DIR} ${GFLAGS_SRC_DIR} ${GLOG_SRC_DIR} ${GTEST_SRC_DIR} ${GPERFTOOLS_SRC_DIR} ${HIREDIS_SRC_DIR} ${IMAGE_MAGICK_SRC_DIR} ${JEMALLOC_SRC_DIR} ${JSONCPP_SRC_DIR} ${LIBEVENT_SRC_DIR} ${LIBEVHTP_SRC_DIR} ${LIBJPEG_SRC_DIR} ${LIBMAGIC_SRC_DIR} ${LIBPNG_SRC_DIR} ${LIBTIFF_SRC_DIR} ${LIBUNWIND_SRC_DIR} ${LIBUUID_SRC_DIR} ${LIBXML2_SRC_DIR} ${LOG4CPLUS_SRC_DIR} ${NCURSES_SRC_DIR} ${READLINE_SRC_DIR} ${LUA_SRC_DIR} ${LIBBSON_SRC_DIR} ${MONGO_C_DRIVER_SRC_DIR} ${MONGO_CXX_DRIVER_SRC_DIR} ${MSGPACK_SRC_DIR} ${OPENCC_SRC_DIR} ${OPENSSL_SRC_DIR} ${PCRE_SRC_DIR} ${PROTOBUF_SRC_DIR} ${RAPIDJSON_SRC_DIR} ${REDIS_SRC_DIR} ${SNAPPY_SRC_DIR} ${SWIG_SRC_DIR} ${NGINX_SRC_DIR} ${TENGINE_SRC_DIR} ${THRIFT_SRC_DIR} ${ZOOKEEPER_SRC_DIR} ${OPENPGM_SRC_DIR} ${ZEROMQ_SRC_DIR} ${UDT_SRC_DIR} ${MYSQL_CLIENT_SRC_DIR} ${LIBWEBSOCKETS_SRC_DIR} ${LEVELDB_SRC_DIR} ${MUPDF_SRC_DIR} ${ASSIMP_SRC_DIR} ${FFMPEG_SRC_DIR} ${ASTYLE_SRC_DIR} ${SPDLOG_SRC_DIR} ${RTMPDUMP_SRC_DIR} ${SRS_SRC_DIR} ${FDK_AAC_SRC_DIR} ${X264_SRC_DIR} ${NASM_SRC_DIR})

LIB_LIST=(m4 autoconf automake libtool helptoman bison flex cmake scons boost curl zlib xz exiv2 flatbuf free_type gflags glog gtest gperftools hiredis image_magick jemalloc jsoncpp libevent libevhtp libjpeg libmagic libpng libtiff libunwind libuuid libxml2 log4cplus ncurses readline lua libbson mongo_c_driver mongo_cxx_driver msgpack opencc openssl pcre protobuf rapidjson redis snappy swig nginx tengine thrift zookeeper openpgm zeromq udt mysql_client libwebsockets leveldb mupdf assimp ffmpeg astyle spdlog rtmpdump srs fdk_aac x264 nasm)

function UnzipAll
{
    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${M4_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${M4_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${AUTOCONF_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${AUTOCONF_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${AUTOMAKE_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${AUTOMAKE_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBTOOL_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBTOOL_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HELPTOMAN_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HELPTOMAN_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${BISON_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${BISON_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${FLEX_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${FLEX_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${CMAKE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${SCONS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${SCONS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${BOOST_BASENAME}.tar.bz2
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${BOOST_BASENAME}.tar.bz2
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${CURL_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${CURL_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ZLIB_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ZLIB_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${XZ_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${XZ_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${EXIV2_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${EXIV2_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${FLATBUF_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${FLATBUF_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${FREE_TYPE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${FREE_TYPE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GFLAGS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GFLAGS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GLOG_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GLOG_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GTEST_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GTEST_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${GPERFTOOLS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${HIREDIS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${IMAGE_MAGICK_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${IMAGE_MAGICK_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${JEMALLOC_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${JEMALLOC_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${JSONCPP_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${JSONCPP_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBEVENT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBEVHTP_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBEVHTP_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBJPEG_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBJPEG_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBMAGIC_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBMAGIC_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBPNG_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBPNG_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBTIFF_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBTIFF_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUNWIND_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBUUID_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBXML2_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBXML2_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LOG4CPLUS_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${NCURSES_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${NCURSES_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${READLINE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${READLINE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LUA_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LUA_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBBSON_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBBSON_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MONGO_C_DRIVER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MONGO_C_DRIVER_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MONGO_CXX_DRIVER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MONGO_CXX_DRIVER_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MSGPACK_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MSGPACK_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${OPENCC_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${OPENCC_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${OPENSSL_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${PCRE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${PCRE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${PROTOBUF_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${PROTOBUF_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${RAPIDJSON_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${REDIS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${REDIS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${SNAPPY_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${SNAPPY_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${SWIG_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${SWIG_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${NGINX_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${NGINX_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${TENGINE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${TENGINE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${THRIFT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${THRIFT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ZOOKEEPER_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${OPENPGM_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${OPENPGM_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ZEROMQ_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ZEROMQ_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${UDT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${UDT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MYSQL_CLIENT_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LIBWEBSOCKETS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LIBWEBSOCKETS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${LEVELDB_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${LEVELDB_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${MUPDF_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${MUPDF_BASENAME}.tar.xz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ASSIMP_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ASSIMP_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${FFMPEG_BASENAME}.tar.bz2
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${FFMPEG_BASENAME}.tar.bz2
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${ASTYLE_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${SPDLOG_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${SPDLOG_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${RTMPDUMP_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${RTMPDUMP_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${SRS_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${SRS_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${FDK_AAC_BASENAME}.tar.gz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${FDK_AAC_BASENAME}.tar.gz
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${X264_BASENAME}.tar.bz2
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${X264_BASENAME}.tar.bz2
        exit 1
    fi

    tar -C ${ARCHIVES_DIR} -xvf ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
    if [ $? -ne 0 ]; then
        echo "failed to unzip" ${ARCHIVES_DIR}/${NASM_BASENAME}.tar.xz
        exit 1
    fi
}
