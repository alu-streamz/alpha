The BeagleBone Black doesn't have an internal battery hence the system and hw time are not persisted across reboots of the board.<br />
Since your board will be connected to internet through its 4G dongle, you can get the proper time set through ntp automatically.<br />
Simply run the following commands.<br />
<pre>
<code>opkg install ntp
rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
cat \<\<EOF \> /etc/ntp.conf
driftfile /etc/ntp.drift
server 0.fr.pool.ntp.org
server 1.fr.pool.ntp.org
server 2.fr.pool.ntp.org
server 3.fr.pool.ntp.org
restrict default ignore
EOF
cat <\<\EOF \> /lib/systemd/system/ntpd.service
[Unit]
Description=Network Time Service
After=network.target

[Service]
Type=forking
PIDFile=/run/ntpd.pid
ExecStart=/usr/bin/ntpd -p /run/ntpd.pid

[Install]
WantedBy=multi-user.target
EOF
cat \<\<EOF /lib/systemd/system/ntpdate.service
[Unit]
Description=Network Time Service (one-shot ntpdate mode)
Before=ntpd.service

[Service]
Type=oneshot
ExecStart=/usr/bin/ntpd -q -g -x
ExecStart=/sbin/hwclock --systohc
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl enable ntpdate.service
systemctl enable ntpd.service
EOF
</code>
</pre>
The time should be automatically set after a reboot of the board.<br />
If you can't wait the reboot to get the time right on your board, run this command.<br />
<code>systemctl start ntpd.service</code> 
