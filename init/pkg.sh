#!/bin/sh

SOURCE='#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin

mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /run
'

mkdir -pv pkg/sbin

printf "$SOURCE" > pkg/sbin/init
chmod -v +x pkg/sbin/init