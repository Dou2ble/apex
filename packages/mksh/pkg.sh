#!/bin/sh

VERSION="R59c"
SRC="https://github.com/MirBSD/mksh/archive/refs/tags/mksh-${VERSION}.tar.gz"

curl -Lo mksh.tar.gz $SRC
tar xvf mksh.tar.gz || exit

cd "mksh-mksh-${VERSION}"

  chmod -v +x Build.sh
  ./Build.sh  

  install -D -m 755 mksh "../pkg/usr/bin/mksh"
  install -D -m 644 mksh.1 "../pkg/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "../pkg/etc/skel/.mkshrc"

cd ..

rm -rv "mksh-mksh-${VERSION}" mksh.tar.gz

