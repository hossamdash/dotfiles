# core dumb
sysctl -p /etc/sysctl.d/50-coredump.conf
# swapiness 
sysctl -p /etc/sysctl.d/99-swappiness.conf
# ymouse remap
systemd-hwdb update
udevadm trigger