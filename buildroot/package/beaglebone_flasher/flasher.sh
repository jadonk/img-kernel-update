#!/bin/bash -e
# See also https://raw.githubusercontent.com/RobertCNelson/boot-scripts/master/tools/beaglebone-black-eMMC-flasher.sh

# Write /usr/share/beaglebone_flasher/flasher.img.xz to /dev/mmcblk1 and halt

cylon_leds () {
	BASE=/sys/class/leds/beaglebone\:green\:usr

	if [ ! -e ${BASE}0/trigger ] ; then
		modprobe -a leds-gpio
		modprobe -a ledstrig-heartbeat
		modprobe -a ledstrig-default-on
		modprobe -a ledstrig-timer
		modprobe -a ledstrig-gpio
	fi

	if [ -e ${BASE}0/trigger ] ; then
		echo none > ${BASE}0/trigger
		echo none > ${BASE}1/trigger
		echo none > ${BASE}2/trigger
		echo none > ${BASE}3/trigger

		STATE=1
		while : ; do
			case $STATE in
			1)	echo 255 > ${BASE}0/brightness
				echo 0   > ${BASE}1/brightness
				STATE=2
				;;
			2)	echo 255 > ${BASE}1/brightness
				echo 0   > ${BASE}0/brightness
				STATE=3
				;;
			3)	echo 255 > ${BASE}2/brightness
				echo 0   > ${BASE}1/brightness
				STATE=4
				;;
			4)	echo 255 > ${BASE}3/brightness
				echo 0   > ${BASE}2/brightness
				STATE=5
				;;
			5)	echo 255 > ${BASE}2/brightness
				echo 0   > ${BASE}3/brightness
				STATE=6
				;;
			6)	echo 255 > ${BASE}1/brightness
				echo 0   > ${BASE}2/brightness
				STATE=1
				killall -SIGUSR1 dd
				;;
			*)	echo 255 > ${BASE}0/brightness
				echo 0   > ${BASE}1/brightness
				STATE=2
				;;
			esac
			sleep 0.1
		done
	fi
}

perform_flash_dd () {
	xzcat /usr/share/beaglebone_flasher/flasher.img.xz | dd of=/dev/mmcblk1 bs=32M
	sync

	[ -e /proc/$CYLON_PID ]  && kill $CYLON_PID

	if [ -e /sys/class/leds/beaglebone\:green\:usr0/trigger ] ; then
		echo default-on > /sys/class/leds/beaglebone\:green\:usr0/trigger
		echo default-on > /sys/class/leds/beaglebone\:green\:usr1/trigger
		echo default-on > /sys/class/leds/beaglebone\:green\:usr2/trigger
		echo default-on > /sys/class/leds/beaglebone\:green\:usr3/trigger
	fi

	echo "Done with flasher.sh. Please power cycle"
	halt
}

cylon_leds & CYLON_PID=$!
perform_flash_dd
