#!/bin/sh

VERSION="5.15.135"
MAJOR="${VERSION%%.*}"
URL="https://mirrors.edge.kernel.org/pub/linux/kernel/v${MAJOR}.x/linux-${VERSION}.tar.xz"

mkdir -pv pkg/boot

wget -O linux.tar.xz $URL
tar xvf linux.tar.xz

cd linux-$VERSION
  make -j$(nproc) mrproper
  make -j$(nproc) defconfig

  make -j$(nproc)  
  make -j$(nproc) modules_install

  mv -iv arch/x86/boot/bzImage ../pkg/boot/vmlinuz-$VERSION
  mv -iv System.map ../pkg/boot/System.map-$VERSION
  mv -iv .config ../pkg/boot/config-$VERSION
cd ..

rm -rv linux-$VERSION linux.tar.xz

  
