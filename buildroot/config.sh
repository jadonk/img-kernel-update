#!/bin/sh
BUILDROOT_DIR=${1:-$HOME/workspace/buildroot}
make -C $BUILDROOT_DIR O=$PWD BR2_EXTERNAL=$PWD beaglebone_flasher_defconfig
