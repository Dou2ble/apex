#!/bin/sh

# following official packaging guidelines: http://www.mirbsd.org/mksh-faq.htm#packaging

VERSION=$(jq -r .version pkg.json)
SRC="https://github.com/MirBSD/mksh/archive/refs/tags/mksh-${VERSION}.tar.gz"

curl -Lo mksh.tar.gz $SRC
tar xvf mksh.tar.gz || exit

cd "mksh-mksh-${VERSION}"

  chmod -v +x Build.sh
  mkdir -v build-mksh build-lksh

  cd build-mksh

    ../Build.sh -r

  cd ..

  cd build-mksh

    ../Build.sh -r -L

  cd ..

  install -Dm 755 build-mksh/mksh "../pkg/usr/bin/mksh"
  install -Dm 644 build-mksh/mksh.1 "../pkg/usr/share/man/man1/mksh.1"
  install -Dm 644 build-mksh/dot.mkshrc "../pkg/etc/skel/.mkshrc"

  install -Dm 755 build-lksh/lksh "../pkg/usr/bin/lksh"
  install -Dm 644 build-lksh/lksh.1 "../pkg/usr/share/man/man1/lksh.1"


cd ..

rm -rv "mksh-mksh-${VERSION}" mksh.tar.gz

