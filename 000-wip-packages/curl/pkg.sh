#!/bin/sh

VERSION="7.85.0"
SRC="https://curl.se/download/curl-${VERSION}.tar.bz2"

curl -o curl.tar.bz2 $SRC
tar xvf curl.tar.bz2 || exit

cd curl-$VERSION

  ./configure --prefix=/usr \
              --with-openssl
  make -j$(nproc)

  make DESTDIR=$(realpath ../pkg) install

cd ..

rm -rv curl-$VERSION curl.tar.bz2