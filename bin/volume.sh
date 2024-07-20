#!/bin/sh
set -e

acpi_listen | while read -r line ; do case "$line" in
	button/volumeup*)
		amixer set Master 5%+ &> /dev/null
		;;
	button/volumedown*)
		amixer set Master 5%- &> /dev/null
		;;
	button/mute*)
		amixer set Master toggle &> /dev/null
		;;
	*)
		;;
esac ; done
