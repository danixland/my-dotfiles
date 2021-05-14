#! /bin/bash
if $(xsetwacom list devices > /dev/null); then
	for i in $(seq 10); do
	    if xsetwacom list devices | grep -q Wacom; then
	        break
	    fi
	    sleep 1
	done
fi

list=$(xsetwacom list devices)
pad=$(echo "${list}" | awk '/pad/{print $8}')
stylus=$(echo "${list}" | xsetwacom list devices | awk '/stylus/{print $8}')

if [ -z "${pad}" ]; then
    exit 0
fi

### TABLET SETTINGS ###
# bottom left
xsetwacom set $pad Button 1 "key +ctrl z -ctrl"
# top left
xsetwacom set $pad Button 3 "key +ctrl y -ctrl"
# bottom right
xsetwacom set $pad Button 8 "key +shift +ctrl s -ctrl -shift"
# top right
xsetwacom set $pad Button 9 "key +ctrl s -ctrl"

### PEN SETTINGS ###
# tip of the pen
xsetwacom set $stylus Button 1 "Button 1"
# bottom Button
xsetwacom set $stylus Button 2 "Button 3"
# top Button
xsetwacom set $stylus Button 3 "Button 2"
