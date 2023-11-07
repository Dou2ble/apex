#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="https://ftp.gnu.org/gnu/make/make-${VERSION}.tar.lz"

curl -o make.tar.lz $SRC
tar xvf make.tar.lz

cd make-$VERSION

  ./configure --prefix=/usr   \
              --without-guile \
              --host=$LFS_TGT \
              --build=$(build-aux/config.guess)

cd ..
