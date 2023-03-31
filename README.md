# nanoDLP-Timelapse
Create a Timelapse functionality with NanoDLP.

I used IP Camera App on an Old Smartphone and curl the snapshot URL to generate an Image. This is Triggered by NanoDLPs Camera FUnction (e.g. on every layer).
Images are Stored in Folder on Raspi (needs to be created first - remember giving correct rights).
When Print is done (checked with curl and parsed with jq) render-script will be fired.

needs gawk, jq
  optional: needs files from http://vontaene.de/raspbian-updates/
See tutorial on https://daniel-strohbach.de/diy-camera-timelapse-fuer-nanodlp-und-einer-ip-camera (its in german)
  switched to ffmpeg
  optional: deletes frames at the end
