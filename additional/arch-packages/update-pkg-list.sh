#!/bin/sh

paru -Qqg base-devel > base-devel.txt
paru -Qqne > all-explicit-packages.txt
grep -vxFf base-devel.txt all-explicit-packages.txt > explicit-packages.txt
echo "base-devel" >> explicit-packages.txt
paru -Qqme > aur-packages.txt
