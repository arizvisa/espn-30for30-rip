#!/bin/sh
prefix="$1"

ffmpeg -f concat -i "decrypted/$prefix.txt" -codec copy -map 0:s? -map 0:v? -map 0:a? -map 0:d? -f mp4 "done/$prefix.mp4"

echo "wrote video to done/$prefix.mp4"
