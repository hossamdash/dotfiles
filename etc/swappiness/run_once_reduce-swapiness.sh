#!/bin/sh
cp ./99-swappiness.conf /etc/sysctl.d/ -f
sysctl -p /etc/sysctl.d/99-swappiness.conf
