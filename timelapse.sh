#!/bin/bash

day=$(date +%m-%d-%Y)
relative=/media/timelapse
echo "creating folder for today"
mkdir $relative/$day/
mkdir $relative/$day/frames/
echo "getting snapshot"
wget -P $relative/$day/frames http://192.168.178.70:8080/photo.jpg --ignore-length #path to store file and ip-camera sn$mv $relative/$day/frames/photo.jpg $relative/$day/frames/timelapse$(date +-%H%M%S).jpg #using mv command to rename file
sync
status=curl http://192.168.178.68/status | jq .Printing

echo "Printer Status: "
if [status == true]
then
  echo "still printing"
fi
if [status == false]
then
  sh $relative/render.sh
  echo "printing seems to be done, rendering video"
fi
