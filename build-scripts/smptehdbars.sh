#!/usr/bin/env sh

# use a recent version of FFmpeg.
# chmod +x smtpehdbars.sh

ffmpeg -f lavfi -i "sine=frequency=440:sample_rate=96000" -f lavfi -i "smptehdbars=size=1920x1080:rate=30*1000/1001" -t "00:00:15.000" -pix_fmt yuv420p -af "loudnorm=I=-24" -vf "scale=640:360" -c:v libx264 -crf 23 -preset medium -profile:v baseline -level 3.0 -c:a aac -b:a 64k -ac 1 -ar 44100 -f mp4 -movflags faststart ../creatives/smptehdbars_360p.mp4
ffmpeg -f lavfi -i "sine=frequency=440:sample_rate=96000" -f lavfi -i "smptehdbars=size=1920x1080:rate=30*1000/1001" -t "00:00:15.000" -pix_fmt yuv420p -af "loudnorm=I=-24" -vf "scale=960:540" -c:v libx264 -crf 23 -preset medium -profile:v high -level 4.0 -c:a aac -b:a 96k -ac 2 -ar 48000 -f mp4 -movflags faststart ../creatives/smptehdbars_540p.mp4
ffmpeg -f lavfi -i "sine=frequency=440:sample_rate=96000" -f lavfi -i "smptehdbars=size=1920x1080:rate=30*1000/1001" -t "00:00:15.000" -pix_fmt yuv420p -af "loudnorm=I=-24" -vf "scale=1280:720" -c:v libx264 -crf 23 -preset medium -profile:v high -level 4.0 -c:a aac -b:a 128k -ac 2 -ar 48000 -f mp4 -movflags faststart ../creatives/smptehdbars_720p.mp4

if [ "$?" != "0" ]; then
    echo "[Error] script failed!" 1>&2
    exit 1
fi
