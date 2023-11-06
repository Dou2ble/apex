#!/bin/sh

VERSION="1.2.3"
SRC="http://www.etalabs.net/musl/releases/musl-${VERSION}.tar.gz"

curl -Lo musl.tar.gz $SRC
tar xvf musl.tar.gz

cd musl-$VERSION

  unset CFLAGS CXXFLAGS

  sed -i "/utmpx.h/s@.*@#define __NEED_time_t\n#include <bits/alltypes.h>@" \
    include/utmp.h

  rm -v src/legacy/utmpx.c include/utmpx.h
  ./configure --prefix=/usr \
    --syslibdir=/usr/lib

  make -j$(nproc)
  make DESTDIR=../pkg install

cd ..

rm -rv musl-$VERSION musl.tar.gz