#! /usr/bin/bash

lidstate=$(cat /proc/acpi/button/lid/LID/state | grep -c open)

xrandr --auto

# closed lid
if [[ $lidstate -eq 0 ]]; then
    xrandr --output HDMI-A-0 --mode 2560x1440
    xrandr --output eDP --off
# open lid
else [[ $lidstate -eq 1 ]];
    xrandr --output eDP --mode 1920x1080
fi

setwallpaper -m scale /home/dhain/Pictures/wallpaper.png
