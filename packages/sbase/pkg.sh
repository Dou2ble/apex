#!/bin/sh

VERSION=$(jq -r .version pkg.json)
SRC="git://git.suckless.org/sbase"

git clone $SRC sbase-git

cd sbase-git
  git checkout $VERSION
  make -j$(nproc)

  make DESTDIR="../pkg" PREFIX=/usr -j$(nproc) install
cd ..

rm -rvf sbase-git
