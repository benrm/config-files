#!/bin/sh
set -e

if [ ! -d "$HOME/Pictures/Screenshtos" ] ; then
	mkdir -p "$HOME/Pictures/Screenshots"
fi

scrot -F "$HOME"'/Pictures/Screenshots/%Y-%m-%d_%s$wx$h.png' -t 10 \
	-e 'notify-send -a "scrot" -i "$m" "$f"'
