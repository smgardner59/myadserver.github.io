#!/usr/bin/env sh

# uses imagemagick 7.  For ImageMagick 6, use `convert` instead of `magick`
# see https://github.com/audreyr/favicon-cheat-sheet

# enhance the script to use pngquant https://pngquant.org/

# Create the image to use as a favicon source.  We'll use FFmpeg's colorbars.
ffmpeg -f lavfi -i "smptehdbars=size=1920x1080" -vframes 1 source-1920x1080.png
magick source-1920x1080.png -gravity Center -extent 1080x1080 source-1080x1080.png
SOURCE="source-1080x1080.png"

# Create favicons for each platform
magick $SOURCE -resize 16x16 -colors 256 ../favicons/favicon-16.png
magick $SOURCE -resize 24x24 -colors 256 ../favicons/favicon-24.png
magick $SOURCE -resize 32x32 -colors 256 ../favicons/favicon-32.png
magick $SOURCE -resize 48x48 -colors 256 ../favicons/favicon-48.png
magick $SOURCE -resize 64x64 -colors 256 ../favicons/favicon-64.png
magick $SOURCE -resize 128x128 -colors 256 ../favicons/favicon-128.png
magick $SOURCE -resize 152x152 -colors 256 ../favicons/favicon-152.png
magick $SOURCE -resize 256x256 -colors 256 ../favicons/favicon-256.png

# Create favicon.ico for old browsers
magick ../favicons/favicon-16.png ../favicons/favicon-32.png -colors 256 ../favicons/favicon.ico

if [ "$?" != "0" ]; then
    echo "[Error] script failed!" 1>&2
    exit 1
fi
