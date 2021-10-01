#!/bin/sh
REPO=https://rcn-ee.net/repos/debian/pool/main/l/linux-upstream/
VERSION=3.8.13-bone86_1stretch_armhf

wget ${REPO}/linux-image-${VERSION}.deb
wget ${REPO}/linux-firmware-image-${VERSION}.deb

