#!/bin/bash

rofi_command="rofi -theme blackpearl/powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        notify-send 'shutting down' 'the system is going to shutdown now'
        sleep 1
        sudo /sbin/shutdown -h now
        ;;
    $reboot)
        notify-send 'rebooting the system' 'the system is going to reboot now'
        sleep 1
        sudo /sbin/shutdown -r now
        ;;
    $lock)
        sleep 1
        i3lock-blur
        ;;
    $suspend)
        sleep 1
        i3suspend
        ;;
    $log_out)
        i3-exit
        ;;
esac

