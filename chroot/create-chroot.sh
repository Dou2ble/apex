#!/bin/sh

# this tool will create the chroot merelinux chroot enviornment that will
# be used in order to build packages

# However this script depends on artools-base from the artix repos

mkdir -v mere-chroot

# base system
basestrap -C pacman.conf mere-chroot base-layout busybox
basestrap -C pacman.conf mere-chroot base

# extra packages needed
basestrap -C pacman.conf mere-chroot build-base curl ca-certs git

cp -v resolv.conf mere-chroot/etc/

# this might be unecessary
yes | pacman -Scc
