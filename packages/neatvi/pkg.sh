#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="https://github.com/aligrudi/neatvi/archive/refs/tags/${VERSION}.tar.gz"

curl -Lo neatvi.tar.gz $SRC
tar xvf neatvi.tar.gz

cd neatvi-$VERSION

  make -j$(nproc)

  install -Dm 644 README -t ../pkg/usr/share/doc/neatvi
  install -Dm 755 vi ../pkg/usr/bin/neatvi

cd ..

rm -rv neatvi-$VERSION neatvi.tar.gz