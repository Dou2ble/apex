#!/bin/sh

VERSION="R59c"
URL="https://github.com/MirBSD/mksh/archive/refs/tags/mksh-${VERSION}.tar.gz"

wget -O mksh.tar.gz $URL
tar xvf mksh.tar.gz

cd "mksh-mksh-${VERSION}"

  chmod -v +x Build.sh
  CC='musl-gcc -static' ./Build.sh -r  

  install -D -m 755 mksh "../pkg/usr/bin/mksh"
  install -D -m 644 mksh.1 "../pkg/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "../pkg/etc/skel/.mkshrc"

cd ..

rm -rv "mksh-mksh-${VERSION}" mksh.tar.gz

