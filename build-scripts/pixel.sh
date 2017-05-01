#!/usr/bin/env sh

# ImageMagick 6...
convert -size 1x1 xc:none ../pixels/1x1.png

# Alternate ImageMagick 7...
# magick -size 1x1 xc:none 1x1.png

if [ "$?" != "0" ]; then
    echo "[Error] script failed!" 1>&2
    exit 1
fi
