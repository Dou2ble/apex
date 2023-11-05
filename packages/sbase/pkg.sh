#!/bin/sh

VERSION="6285c22a07893303bc8719afefe3e878ed6bc887"
SRC="git://git.suckless.org/sbase"

git clone $SRC sbase-git

cd sbase-git
  git checkout $VERSION
  make -j$(nproc)

  make DESTDIR="../pkg" PREFIX=/usr -j$(nproc) install
cd ..

rm -rvf sbase-git
