#!/bin/sh
FILE=121202-BBB.img
mkdir /mnt/boot
mkdir /mnt/rootfs
sudo mount -o loop,rw,sync,offset=32256 121202-BBB.img /mnt/boot
sudo mount -o loop,rw,sync,offset=74027520 121202-BBB.img /mnt/rootfs
