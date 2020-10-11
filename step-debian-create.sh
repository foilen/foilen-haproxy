#!/bin/bash

set -e

RUN_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $RUN_PATH

echo ----[ Create .deb ]----
DEB_FILE=foilen-haproxy_${VERSION}_amd64.deb
DEB_PATH=$RUN_PATH/build/debian_out/foilen-haproxy
rm -rf $DEB_PATH
mkdir -p $DEB_PATH $DEB_PATH/DEBIAN/ $DEB_PATH/usr/sbin/

cat > $DEB_PATH/DEBIAN/control << _EOF
Package: foilen-haproxy
Version: $VERSION
Maintainer: Foilen
Architecture: amd64
Description: This is an HA Proxy with some libraries statically linked.
_EOF

cp -rv DEBIAN $DEB_PATH/
cp -rv build/haproxy/haproxy $DEB_PATH/usr/sbin/

cd $DEB_PATH/..
dpkg-deb --no-uniform-compression --build foilen-haproxy
mv foilen-haproxy.deb $DEB_FILE
