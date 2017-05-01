#!/usr/bin/env sh

# uses imagemagick 7.  For ImageMagick 6, use `convert` instead of `magick`
# see https://github.com/audreyr/favicon-cheat-sheet

# enhance the script to use pngquant https://pngquant.org/

# Create the source icon
magick xc:none source.svg

SOURCE="source.svg"

magick $SOURCE -resize 16x16 ../favicons/favicon-16.png
magick $SOURCE -resize 24x24 ../favicons/favicon-24.png
magick $SOURCE -resize 32x32 ../favicons/favicon-32.png
magick $SOURCE -resize 48x48 ../favicons/favicon-48.png
magick $SOURCE -resize 64x64 ../favicons/favicon-64.png
magick $SOURCE -resize 128x128 ../favicons/favicon-128.png
magick $SOURCE -resize 256x256 ../favicons/favicon-256.png

magick $SOURCE ../favicons/favicon-16.png ../favicons/favicon-24.png ../favicons/favicon-32.png ../favicons/favicon-48.png ../favicons/favicon-64.png ../favicons/favicon-128.png ../favicons/favicon-256.png -colors 256 ../favicons/favicon.ico

# and the lazy way for android devices
magick $SOURCE -resize 152x152 ../favicons/favicon-152.png


if [ "$?" != "0" ]; then
    echo "[Error] script failed!" 1>&2
    exit 1
fi
