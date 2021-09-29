#!/bin/sh
mkdir -p kernel
cd kernel
ar x ../linux-image-3.8.13-bone86_1stretch_armhf.deb
cd ..
mkdir -p firmware
cd firmware
ar x ../linux-firmware-image-3.8.13-bone86_1stretch_armhf.deb
cd ..
