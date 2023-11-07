#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="git://repo.or.cz/tinycc.git"

git clone $SRC tcc-git
tar xvf tcc.tar.bz2

cd tcc-git

  git checkout $VERSION

  ./configure --prefix=/usr \
              --config-musl \
              --cc=clang

  make -j$(nproc)

  make DESTDIR=../pkg install

cd ..

rm -rvf tcc.tar.bz2 tcc-git