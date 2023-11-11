#!/usr/bin/env mksh
# shellcheck shell=ksh

# following the freedesktop standard :)
# https://www.freedesktop.org/software/systemd/man/latest/os-release.html

mkdir -pv pkg/{etc,usr/lib}

cp -v os-release pkg/usr/lib

ln -vs ../usr/lib/os-release pkg/etc/os-release
ln -vs ../usr/lib/os-release pkg/etc/initrd-release