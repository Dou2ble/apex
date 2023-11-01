VERSION="1.2.3"
URL="http://www.etalabs.net/musl/releases/musl-${VERSION}.tar.gz"

wget -O musl.tar.gz $URL
tar xvf musl.tar.gz

unset CFLAGS CXXFLAGS

cd musl-$VERSION
  sed -i "/utmpx.h/s@.*@#define __NEED_time_t\n#include <bits/alltypes.h>@" \
        include/utmp.h

  rm -v src/legacy/utmpx.c include/utmpx.h

  ./configure --prefix=/usr \
              --libdir=/lib \
              --syslibdir=/lib

  make -j$(nproc)
  make DESTDIR=../pkg -j$(nproc) install
cd ..

rm -rv musl-$VERSION musl.tar.gz


