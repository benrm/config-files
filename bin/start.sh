#!/bin/sh
set -e

feh --bg-scale ~/.wallpapers/gradient.jpg &

dunst &

google-chrome-stable --profile-directory="Profile 1" --restore-last-session &
/usr/bin/slack &
/usr/share/discord/Discord &
