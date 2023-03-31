#!/bin/bash

day=$(date +%m-%d-%Y)
relative=/media/timelapse
echo "renaming files to be in order"
cd $relative/$day/frames
find . -name '*.jpg'| sort -n | gawk 'BEGIN{ a=0 }{ printf "mv %s %04d.jpg\n", $0, a++ }' | bash
#gst-launch-1.0 multifilesrc location=$relative/$day/frames/%06d.jpeg index=1 caps="image/jpeg,framerate=24/1" ! jpegdec ! omxh264enc ! avimux ! filesink location=timelapse-$day.avi
echo "Conversion complete"
echo "Now converting video (This may take a few minutes...)"

ffmpeg -r 24 -i %04d.jpg -s:v 1920x1080 -c:v libx264 timelapse-$day.mp4
mv timelapse-$day.mp4 $relative/$day
#echo "Cleaning up...."
#sudo rm -rf $relative/$day/frames/
#clear

echo "Your timelapse video is ready! You may view your video at" $relative/$day/
