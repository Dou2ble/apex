#!/bin/sh

VERSION="12"
SRC="https://github.com/aligrudi/neatvi/archive/refs/tags/${VERSION}.tar.gz"

curl -Lo neatvi.tar.gz $SRC
tar xvf neatvi.tar.gz

cd neatvi-$VERSION

  make -j$(nproc)
  install -D -m755 vi ../pkg/usr/bin/neatvi

cd ..

rm -rv neatvi-$VERSION neatvi.tar.gz