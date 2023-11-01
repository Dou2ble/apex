#!/bin/sh

VERSION="2.2.0"
URL="https://github.com/13-CF/afetch/archive/refs/tags/V${VERSION}.tar.gz"

wget -O afetch.tar.gz $URL
tar xvf afetch.tar.gz

cd afetch-$VERSION

  make CC="musl-gcc -static" -j$(nproc)
  make PREFIX=/usr DESTDIR=../pkg -j$(nproc) install

cd ..

rm -rvf afetch-$VERSION afetch.tar.gz