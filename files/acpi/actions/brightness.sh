#!/bin/sh
set -e

case "$1" in
	video/brightnessdown*)
		brightnessctl set 10%-
		;;
	video/brightnessup*)
		brightnessctl set +10%
		;;
esac
