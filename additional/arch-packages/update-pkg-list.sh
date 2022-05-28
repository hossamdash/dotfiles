#!/bin/sh

paru -Qqg base-devel > base-devel.txt
paru -Qqne > all-explicit-packages.txt
grep -vxFf base-devel-without-sudo.txt all-explicit-packages.txt > explicit-packages.txt
rm all-explicit-packages.txt
echo "base-devel" >> explicit-packages.txt
paru -Qqme > aur-packages.txt
