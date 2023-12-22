#!/usr/bin/env mksh
# shellcheck shell=ksh

if [ $# -eq 0 ]
then
  print "Please provide a package to build"
  exit 1
fi

cd "$(dirname "$0")" || exit 1

# rm -v bin/${1}.tar.lz{,.sha512}

cd packages || exit 1
  cd "$1" || exit 1

    rm -rvf pkg/
    version=$(jq -r .version pkg.json)

    chmod -v +x pkg.sh
    ./pkg.sh

    cd pkg || exit 1
      tar cvf "${1}.tar.lz" ./*
    cd ..

  cd ..
cd ..

cd bin || exit 1

  mv "../packages/${1}/pkg/${1}.tar.lz" "${1}-${version}.tar.lz"
  sha512sum "${1}-${version}.tar.lz" > "${1}-${version}.tar.lz.sha512"

cd ..



