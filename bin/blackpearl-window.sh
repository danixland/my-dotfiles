#!/bin/sh

case $1 in
	all )
		rofi -no-lazy-grab -show window -theme blackpearl/appmenu.rasi
		;;
	desktop )
		rofi -no-lazy-grab -show windowcd -theme blackpearl/appmenu.rasi
		;;
esac


