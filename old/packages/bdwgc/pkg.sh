
VERSION=$(jq -r .version pkg.json)
SRC="https://github.com/ivmai/bdwgc/releases/download/v${VERSION}/gc-${VERSION}.tar.gz"

curl -Lo gc.tar.gz $SRC
tar xvf gc.tar.gz

cd gc-$VERSION

  ./configure --prefix=/usr
  make -j$(nproc)  
  make DESTDIR=$(realpath ../pkg) install

cd ..

rm -rv gc-$VERSION gc.tar.gz