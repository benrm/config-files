#!/bin/sh
set -e

PIDDIR=~/.pids

mkdir -p "$PIDDIR"

PIDFILE="$PIDDIR/polybar.pid"

polybar &
NEWPID="$!"

sleep 1

if [ -e "$PIDFILE" ] ; then
	read PID < "$PIDFILE"
	kill -9 "$PID" || echo "Failed to kill Polybar $PID as specified in $PIDFILE"
fi

echo "$NEWPID" > "$PIDFILE"
