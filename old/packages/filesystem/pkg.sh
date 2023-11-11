#!/usr/bin/env mksh
# shellcheck shell=ksh

mkdir -pv pkg/{boot,etc,home,var,mnt,dev,proc,sys,tmp,root,usr/{bin,lib,share,include}}

ln -vs /usr/bin pkg/bin
ln -vs /usr/bin pkg/sbin
ln -vs /usr/bin pkg/usr/sbin

ln -vs /usr/lib pkg/lib
ln -vs /usr/lib pkg/lib64
ln -vs /usr/lib pkg/usr/lib64