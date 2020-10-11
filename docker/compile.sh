#!/bin/bash

set -e

cd /build

echo ++++[ Git clone ]++++
if [ -d haproxy ]; then
    echo Already cloned
else
    git clone http://git.haproxy.org/git/haproxy-1.7.git/ haproxy
fi

echo ++++[ Git switch branch ]++++
cd /build/haproxy
git checkout v1.7.12

echo ++++[ Compile ]++++
export 
export 
export 
make \
    TARGET=linux26 \
    USE_OPENSSL=1 \
    USE_STATIC_PCRE=1 \
    USE_ZLIB=1
