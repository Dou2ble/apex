#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="git://git.suckless.org/ubase"

git clone $SRC ubase-git

cd ubase-git
  git checkout $VERSION
  make -j$(nproc)

  make DESTDIR="../pkg" PREFIX="/usr" -j$(nproc) install
cd ..

rm -rvf ubase-git