#!/usr/bin/env bash
cp ./50-coredump.conf /etc/sysctl.d/ -f
sysctl -p /etc/sysctl.d/50-coredump.conf
