#!/bin/sh
cd rootfs/boot
sudo mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n Debian/3.8.13-bone86 -d vmlinuz-3.8.13-bone86 uImage-3.8.13-bone86
sudo ln -sf uImage-3.8.13-bone86 uImage
