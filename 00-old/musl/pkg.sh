
VERSION="1.1.24_18"
URL="https://ftp.acc.umu.se/mirror/voidlinux/current/musl/musl-${VERSION}.x86_64-musl.xbps"

wget -O musl.xbps $URL

mkdir -v pkg
tar xvf musl.xbps -C pkg/
rm -v pkg/files.plist
rm -v pkg/files.plist

