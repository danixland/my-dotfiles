#!/bin/bash
PIDFILE=${PIDFILE:-/tmp/wallpaper.pid}

trap "rm -f $PIDFILE" SIGUSR1

# set background function (requires input)
function wpapers () {
	if [[ -f $1 ]]; then
		# We have a single file as input
		feh --bg-fill --no-fehbg $1
		exit 0
	elif [[ -d $1 ]]; then
		# directory as input
		while true; do
			BGIMG=$(find $1 -type f -print | shuf -n1)
			feh --bg-fill --no-fehbg $BGIMG
			sleep 5m
		done
	fi
}

if [[ -f $PIDFILE ]]; then
	# PIDFILE exists, so I guess there's already an instance running
	# let's kill it and run again
	kill $(cat $PIDFILE) > /dev/null 2>&1
	rm $PIDFILE
fi

# create PIDFILE
echo $$ > $PIDFILE

## MAIN ##
# do we have input?
if [[ ! -z $1 ]]; then
	WPAPERS=$1
else
	# No input. We'll use our predefined directory
	WPAPERS="/home/danix/Pictures/wallpapers/black"
fi

wpapers $WPAPERS

