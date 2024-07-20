#!/bin/sh
set -e

google-chrome-stable --profile-directory="Profile 1" --restore-last-session &
/usr/bin/slack &
/usr/share/discord/Discord &
