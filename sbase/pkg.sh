#!/bin/sh

VERSION="6285c22a07893303bc8719afefe3e878ed6bc887"
URL="git://git.suckless.org/sbase"

git clone $URL sbase-git

cd sbase-git
  git checkout $VERSION
  # make CC="musl-gcc -static" -j$(nproc)
  make -j$(nproc)

  make DESTDIR="../pkg" PREFIX=/usr -j$(nproc) install
cd ..

rm -rvf sbase-git
