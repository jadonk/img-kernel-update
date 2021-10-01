#!/bin/sh
VERSION=3.8.13-bone86_1stretch_armhf
mkdir -p kernel
cd kernel
ar x ../linux-image-${VERSION}.deb
cd ..
mkdir -p firmware
cd firmware
ar x ../linux-firmware-image-${VERSION}.deb
cd ..
