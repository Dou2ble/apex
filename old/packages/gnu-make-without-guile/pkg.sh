#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="https://ftp.gnu.org/gnu/make/make-4.4.1.tar.lz"

curl -o make.tar.lz $SRC
tar xvf make.tar.lz

cd make-$VERSION

  ./configure --prefix=/usr \
              --without-guile
              
  make -j$(nproc)
  make DESTDIR=../pkg install

cd ..

rm -rv make-$VERSION make.tar.lz