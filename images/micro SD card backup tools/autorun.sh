#!/bin/sh
echo timer > /sys/class/leds/beaglebone\:green\:usr0/trigger 
dd if=/dev/mmcblk1 of=/mnt/BeagleBoneBlack-eMMC-image-$RANDOM.img bs=10M 
sync
echo default-on > /sys/class/leds/beaglebone\:green\:usr0/trigger
