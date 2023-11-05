#!/bin/sh

VERSION="1.21.4"
URL="https://ftp.gnu.org/gnu/wget/wget-${VERSION}.tar.gz"

wget -O wget.tar.gz $URL
tar xvf wget.tar.gz

cd wget-$VERSION

cd ..