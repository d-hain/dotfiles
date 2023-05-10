#!/bin/bash

folder="swaylock-blur-screenshots"
file="screenshot.png"
file_blurred="screenshot_blurred.png"

# Create folder if non-existent
mkdir -p /tmp/$folder
# Take a screenshot of the screen and save it into the folder
grim -t png -l 8 /tmp/$folder/$file
# Blur the screenshot
convert /tmp/$folder/$file -blur 0x8 /tmp/$folder/$file_blurred

# Lock the screen
swaylock \
	--image /tmp/$folder/$file_blurred \
	--daemonize

# Delete the images
rm -rf /tmp/$folder/$file /tmp/$folder/$file_blurred


