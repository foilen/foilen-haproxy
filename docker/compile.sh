#!/bin/bash

set -e

echo ++++[ OpenSSL - Git clone ]++++
cd /build
if [ -d openssl ]; then
    echo Already cloned
else
    git clone git://git.openssl.org/openssl.git openssl
fi

echo ++++[ OpenSSL - Git switch branch ]++++
cd /build/openssl
git checkout OpenSSL_1_0_2u

echo ++++[ OpenSSL - Compile ]++++
./config no-shared --prefix=/build/staticlibs
make && make install_sw


echo ++++[ HA Proxy - Git clone ]++++
cd /build
if [ -d haproxy ]; then
    echo Already cloned
else
    git clone http://git.haproxy.org/git/haproxy-1.7.git/ haproxy
fi

echo ++++[ HA Proxy - Git switch branch ]++++
cd /build/haproxy
git checkout v1.7.12

echo ++++[ HA Proxy - Compile ]++++
make \
    ADDLIB=-ldl \
    SSL_INC=/build/staticlibs/include SSL_LIB=/build/staticlibs/lib \
    TARGET=linux26 \
    USE_OPENSSL=1 \
    USE_STATIC_PCRE=1 \
    USE_ZLIB=1
