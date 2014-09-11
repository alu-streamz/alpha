Alpha
=====

StreamZ is an initiative to foster the creation of wirelessly connected objects that build on 4G to deliver new services. We can explore together all the means to get a working and easy to use 4G prototyping platform: using linux boards equiped with 4G usb dongles, integrating 4G connectivity within the linux board itself, embedding an integrated development environment, including sxamples of services demonstrating the 4G specificities...

The alpha version of the StreamZ kit is composed of a BeagleBone Black, a 4G usb dongle, a 4 SIM card, a mini usb cable, and a power supply.


Plug the kit
======================

To get started with the kit, first assemble the parts together as follow:
<ul>
<li>plug the 4G usb dongle (with its 4G SIM card inserted in its SIM slot) into the USB slot of the BeagleBone Black</li>
<li>plug the power supply connector to the 5V supply slot of the BeagleBone Black, located near the ethernet slot</li>
<li>power on the board by plugging the other end of the power supply</li>
</ul>


You should be all set. The board will boot up and connect to the available wireless network; a solid blue led on the 4G usb dongle will confirm that the kit is wirelessly connected to internet.


Connect to the kit / USB style
======================

<ul>
<li>plug the mini usb end of the usb cable into the BeagleBone Black usb slot located near the ethernet slot</li>
<li>plug the other end of the usb cable into a PC. The BeagleBone Black should appear as an external storage device (let say... E:/ in our example).</li>
<li>install the BeagleBone Black drivers by running the appropriate executable in the "Drivers" folder of E:/ (remember we picked E:/ as the external storage device in our example)</li>
<li>the BeagleBone Black should automatically create a link to the PC and be accessible at the address 192.168.7.2</li>
<li>you can ssh into the BeagleBone Black at address 192.168.7.2 using user "root" (no password by default)</li>
<code>
ssh -l root 192.168.7.2
</code>
<li>you can get access the BeagleBone Black info page at the url http://192.168.7.2</li>
<li>you can access the Cloud9 IDE of the beagleBone Black using your web browser at the url http://192.168.7.2:3000</li>
</ul>

Connect to the kit / Ethernet style
======================

By default, the BeagleBone Black that comes with the kit is configured with the static IP address 192.168.1.2 for its ethernet connection. You can connect it to your LAN if it is in the 192.168.1.x subnet.

<ul>
<li>plug an ethernet cable between your BeagleBone Black and your router, switch, or PC</li>
<li>you can ssh into the BeagleBone Black at address 192.168.1.2 using user "root" (no password by default)</li>
<code>
ssh -l root 192.168.1.2
</code>
<li>you can get access the BeagleBone Black info page at the url http://192.168.1.2</li>
<li>you can access the Cloud9 IDE of the beagleBone Black using your web browser at the url http://192.168.1.2:3000</li>
</ul>

Please, close the door
======================

By default, in the BeagleBone Black the root user has no password defined.
Once logged in through ssh, you should set your own password to restrict the access to this account.<br />
<code>
passwd My_N3w_PassW0rd
</code>

Write and test your first code with Cloud9
======================

<ul>
<li>access the Cloud9 IDE of the BeagleBone Black by pointing your web browser at the url http://192.168.1.2:3000 (ethernet connection) or http://192.168.7.2:3000 (usb connection)</li>
<li>enter the cloud9 username/password that was provided to you with the kit (paper card inside the beaglebone black box)</li>
<li>look at javascript examples in "demo" folder of the left "Project Files" pane, see how to control the GPIOs or the leds</li>
<li>create a new file from the menu File>New File (or use the Control+N shortcut)</li>
<li>write your code</li>
<li>test your code by hitting the "Run" button on top (or use the Control+F5 shortcut)</li>
</ul>

Congratulations! You have just tamed your BeagleBone Black!<br />
Now go and build awesome stuff!


Change Cloud9 default login/password
=================

If you intend to set up IPv6, make sure to change the default cloud9 credentials.<br />
In the file /usr/share/cloud9, replace the user/password:<br />
<pre>
<code>
...
secure: {
  user: "new_username",
  password: "new_password"
}
</code>
</pre>



Get IPv6 working
==================
Yes, IPv6 works fine on your kit. To get it set up, do the following:
<ul>
<li>change the /etc/network/interfaces file<br />
replace line <code>iface wwan0 inet dhcp</code> by line <code>iface wwan0 inet6 dhcp</code></li>
<li>replace the /home/root/4Glink file with 4Glink_ipv6<br />
and in this file replace ipv6_apn with the proper IPv6 APN. Ask your streamz contact to get it if you don't know :) </li>
<li>Set the ipv6 dns servers in the file /etc/resolv.conf as follow:<br />
<pre><code>
nameserver 2a01:cd00:7fff:0:192:168:10:110
nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844
</code>
</pre></li>
</ul>
Once you restart your beaglebone, you should be connected to ipv6 and able to ping.<br />
For example: <code>ping6 alu-streamz.mobi</code>   ;)<br />
<br />
Enjoy ipV6 over LTE on your connected object!


Backup the image of the internal eMMC to a micro SD card
==================
Here are the steps to backup the image of the internal eMMC to a micro SD card:
<ul>
<li>on you PC, plug in the micro SD card (typically itself plugged inside a SD card adaptor) in the SD card reader</li>
<li>format the SD card to FAT format</li>
<li>copy all files from the <code>images/micro SD card backup tools</code> folder to the SD card</li>
<li>eject the microSD card from your computer and remove it from the reader</li>
<li>now plug the micro SD card into the (powered off) BeagleBone Black micro SD card slot</li>
<li>power the BeagleBone Black through its AC power (not USB)</li>
<li>the 4 leds on the BeagleBone Black should start blinking, while the backup is in progress</li>
<li>when the backup is done, the 4 leds on the BeagleBone Black should remain solid (this takes generally up to 10 minutes)</li>
<li>unpower the BeagleBone Black, and remove the micro SD card</li>
<li>the eMMC image is now on the micro SD card, typically named <code>BeagleBoneBlack-eMMC-image-$RANDOM.img</code>, to avoid accidental erasing of a previous backed up image</li>
<li>archive the eMMC image file from the micro SD onto your computer, and remove it from the micro SD card to avoid any future disk space shortage on the micro SD card</li>
</ul>


Restore an eMMC image from the micro SD card to the internal eMMC
==================
Here are the steps to backup the image of the internal eMMC to a micro SD card:
<ul>
<li>on you PC, plug in the micro SD card (typically itself plugged inside a SD card adaptor) in the SD card reader</li>
<li>format the SD card to FAT format, if not already done</li>
<li>copy all files from the <code>images/micro SD card restore tools</code> folder to the SD card (or just the autorun.sh if you are using a micro SD card prepared with the backup files)</li>
<li>upload on the micro SD card the eMMC image you want to restore for the BeagleBone Black. (remove unnecessary eMMC images you might have put there, if you are a serial eMMC flasher)</li>
<li>edit the autorun.sh file on your micro SD card, and replace the image file name to match the one you just uploaded</li>
<li>eject the microSD card from your computer and remove it from the reader</li>
<li>now plug the micro SD card into the (powered off) BeagleBone Black micro SD card slot</li>
<li>power the BeagleBone Black through its AC power (not USB)</li>
<li>the 4 leds on the BeagleBone Black should start blinking, while the restore is in progress</li>
<li>when the backup is done, the 4 leds on the BeagleBone Black should remain solid (this takes generally up to 10 minutes)</li>
<li>unpower the BeagleBone Black, and remove the micro SD card</li>
<li>the eMMC image is now flashed onto the internal eMMC</li>
</ul>
