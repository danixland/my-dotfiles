#!/bin/bash

rofi_command="rofi -theme blackpearl/utilsmenu.rasi"

### Options ###
wpaper=""
webdevel=""
# Variable passed to rofi
options="$wpaper\n$webdevel"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $wpaper)
        change_wallpaper.sh
        ;;
    $webdevel)
        webdevel
        ;;
esac

