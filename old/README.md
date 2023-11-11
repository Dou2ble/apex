# THIS IS VERY WIP

## very breif overview of what everything here is
The `chroot` folder contains files in order to create a merelinux chroot enviornment that is used to build packages. NOTE: this is only a temporary measure. Once enough packages are built in order to be able to create a apexlinux chroot it will be used instead of the merelinux chroot.

## **DONE:** pkg.json migration
- [x] filesystem
- [x] mksh
- [x] musl
- [x] neatvi
- [x] sbase
- [x] tcc
- [x] ubase

## TODO Changes:
- [ ] remove make flags from pkg.sh
- [ ] add /usr/share/doc to sbase and ubase
- [ ] fix shellcheck error in apex-src-auto
- [ ] package bdwgc properly (https://github.com/ivmai/bdwgc#installation-and-portability)

## TODO When a c++ toolchain is made:
- [ ] add --enable-cplusplus to ./configure in bdwgc

## Packages todo (in order of importance):
- [x] c compiler toolchain
- [x] text editor
- [ ] linux
- [ ] guile
- [ ] make
- [ ] libressl
- [ ] git
- [ ] jq
- [x] pacakge mksh properly (http://www.mirbsd.org/mksh-faq.htm#packaging)
- [ ] go (gc toolchain)

## shitty notes:
check cheksums like this:
```bash
sha512sum -c filesystem-2023-11-06.tar.lz.sha512sum
```