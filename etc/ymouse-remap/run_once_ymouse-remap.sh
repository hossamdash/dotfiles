#!/bin/sh
cp ./80-ymouse-remap.hwdb /etc/udev/hwdb.d/ -f
systemd-hwdb update
udevadm trigger
