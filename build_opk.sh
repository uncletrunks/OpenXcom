#!/bin/sh

cd build
make -j$(nproc)
cd ..

convert res/linux/icons/openxcom_48x48.png  -resize 32x32! build/bin/icon.png

mksquashfs \
    build/bin/*         \
    build/bin/icon.png                      \
    default.gcw0.desktop openxcom-$(date '+%s').opk -noappend
