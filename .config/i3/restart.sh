#! /usr/bin/bash

lidstate=$(cat /proc/acpi/button/lid/LID/state | grep -c open)
font_size_yml="/home/dhain/.config/alacritty/font_size.yml"

xrandr --auto

# closed lid
if [[ $lidstate -eq 0 ]]; then
    > $font_size_yml
    echo -e "font:\n  size: 13.0\n" > $font_size_yml

    xrandr --output HDMI-A-0 --mode 2560x1440
    xrandr --output eDP --off
# open lid
else [[ $lidstate -eq 1 ]];
    > $font_size_yml
    echo -e "font:\n  size: 8.0\n" > $font_size_yml

    xrandr --output eDP --mode 1920x1080
fi

setwallpaper -m scale /home/dhain/Pictures/wallpaper.png
