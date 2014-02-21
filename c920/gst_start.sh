#!/bin/bash

# sudo rmmod uvcvideo
# sudo modprobe uvcvideo quirks=128

DEFAULT_FPS=30
DEFAULT_WIDTH=1024
DEFAULT_HEIGHT=570
DEFAULT_CHROMA=1

PORT_START=4000

CAM_WIDTH_1=1900
CAM_HEIGHT_1=1080
CAM_WIDTH_2=1024
CAM_WIDTH_2=570
CAM_WIDTH_3=1024
CAM_HEIGHT_3=570
CAM_WIDTH_4=640
CAM_WIDTH_4=480

destinationIp=${1?"No IP address given"}
webcamWidth=${2:-$DEFAULT_WIDTH}
webcamHeight=${3:-$DEFAULT_HEIGHT}
webcamFps=${4:-$DEFAULT_FPS}
webcamChroma=$DEFAULT_CHROMA


function help {
  echo "Program parameters:"
  echo "    <program> destination_ip [width [height [fps]]]"
  echo ""
}

help

videoDev=$(ls /dev/video*)
echo "Found $(echo $videoDev | wc -w) video devices."

echo "Image width:	$webcamWidth"
echo "Image height:	$webcamHeight" 
echo "Image fps:	$webcamFps"
echo ""

rtpPort=$PORT_START
for currentDev in $videoDev; do
  echo "Publishing $currentDev to $destinationIp:$rtpPort"
  v4l2-ctl -d $currentDev --set-fmt-video=width=$webcamWidth,height=$webcamHeight,pixelformat=$webcamChroma
  v4l2-ctl -d $currentDev --set-parm=$webcamFps

  ./bonecam/capture/capture -d $currentDev -o | gst-launch -e filesrc location=/dev/fd/0 ! legacyh264parse ! rtph264pay ! udpsink host=$destinationIp port=$rtpPort &
  rtpPort=$((rtpPort + 2))
done

# Wait for Ctrl+c
echo ""
echo "Type Ctrl+c to stop."
while true; do sleep 1000; done 
