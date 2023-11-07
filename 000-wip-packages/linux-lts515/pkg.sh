#!/bin/sh

VERSION="5.15.137"
SRC="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${VERSION}.tar.xz"

curl -o linux.tar.xz $SRC

tar xvf linux.tar.xz

cd linux-$VER