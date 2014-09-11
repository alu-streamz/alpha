#!/bin/sh
echo timer > /sys/class/leds/beaglebone\:green\:usr0/trigger 

dd if=/mnt/BeagleBoneBlack-eMMC-image-StreamZ-3.img of=/dev/mmcblk1 bs=10M
sync
echo default-on > /sys/class/leds/beaglebone\:green\:usr0/trigger
