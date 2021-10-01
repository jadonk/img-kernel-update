#!/bin/sh
BUILDROOT_DIR=${1:-/tmp/buildroot-2020.11}
make -C $BUILDROOT_DIR O=$PWD BR2_EXTERNAL=$PWD beaglebone_flasher_defconfig
