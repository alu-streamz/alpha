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

Get IPv6 working
==================
Yes, IPv6 works fine on your kit. To get it set up, do the following:
<ul>
<li>change the /etc/network/interfaces file</li>
replace line <code>iface wwan0 inet dhcp</code> by line <code>iface wwan0 inet6 dhcp</code>
<li>change the /home/root/4Glink file</li>
replace the lines<br />
<code>dhclient wwan0</code><br />
with <br />
<pre>
<code>ifconfig wwan0 down
sleep 1
ifconfig wwan0 up
route -A inet6 add default dev wwan0</code>
</pre><br />
...and  replace the line<br />
<code>echo 'AT^NDISDUP=1,1,"ipv4_apn","apn_user"," apn_password"\r\n' > /dev/ttyUSB1 </code><br />
with the line<br />
<code>echo 'AT^NDISDUP=1,1,"ipv6_apn"\r\n' > /dev/ttyUSB1</code><br />
<li>in the file /etc/resolv.conf, add the following lines:<br /></li>
<pre>
<code>nameserver 2001:4860:4860::8888
nameserver 2001:4860:4860::8844</code>
</pre>
</ul>
Once you restart your beaglebone, you should be connected to ipv6 and able to ping<br />
example: <code>ping6 alcatel-lucent.com</code><br />
<br />
Enjoy ipV6 over LTE on your connected objet!
