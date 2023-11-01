#!/bin/sh

VERSION="a015607af0075badc0cd90523c43f391daa0572d"
URL="git://git.suckless.org/ubase"

git clone $URL ubase-git

cd ubase-git
  git checkout $VERSION
  make CC="musl-gcc -static" -j$(nproc)

  make DESTDIR="../pkg" PREFIX="/usr" -j$(nproc) install
cd ..

rm -rvf ubase-git