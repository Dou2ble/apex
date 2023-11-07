#!/bin/sh

cd "$(dirname "$0")" || exit 1

for pkg in $(ls packages)
do
  ./apex-src.sh $pkg
done