VERSION="36f53cdc3bb556a7ec31b67c9b20ec32892e7142"
URL="git://repo.or.cz/tinycc.git"

git clone $URL tcc-git
git checkout $VERSION

cd tcc-git
  ./configure --prefix=/usr \
              --disable-shared \
              --enable-static

  make CC="musl-gcc -static" -j$(nproc)
  make DESTDIR=../pkg -j$(nproc) install
cd ..

rm -rvf tcc-git