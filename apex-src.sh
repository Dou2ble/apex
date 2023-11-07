#!/bin/sh

if [ $# -eq 0 ]
then
  echo "Please provide a package to build"
  exit 1
fi

cd "$(dirname "$0")" || exit 1

cd packages || exit 1
  cd "$1" || exit 1

    rm -rvf pkg/

    chmod -v +x pkg.sh
    ./pkg.sh

    cd pkg || exit 1
      tar cvf "${1}.tar.lz" ./*
    cd ..

  cd ..
cd ..

mv "packages/${1}/pkg/${1}.tar.lz" bin/


