URL="https://github.com/larmel/lacc.git"
VERSION="30839843daaff9d87574b5854854c9ee4610cdcd"

git clone $URL lacc-git

cd lacc-git

  git checkout $VERSION

  ./configure --prefix=/usr
  make CC="musl-gcc -static" -j$(nproc)
  make DESTDIR=../pkg install

cd ..

rm -rvf lacc-git

