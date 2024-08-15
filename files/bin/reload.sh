#!/bin/sh
set -e

pkill polybar || echo "No polybar running"
polybar &
