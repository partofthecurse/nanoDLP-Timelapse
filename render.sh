#!/bin/bash

day=$(date +%m-%d-%Y)
relative=/media/timelapse/
echo "renaming files to be in order"
find -name '$relative/$day/frames/*.jpg' | gawk 'BEGIN{ a=1 }{ printf "mv %s $relative/$day/frames/%06d.jpg\n", $0, a++$echo "Now converting video (This may take a few minutes...)"
gst-launch-1.0 multifilesrc location=$relative/$day/frames/%06d.jpeg index=1 caps="image/jpeg,framerate=24/1" ! jpegdec$echo "Conversion complete"
echo
echo
echo "Cleaning up...."
sudo rm -rf $relative/$day/frames/
clear
echo "Your timelapse video is ready! You may view your video at $relative/$day/"
echo
