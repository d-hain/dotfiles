#! /bin/bash

upower -i `upower -e | rg BAT` | rg percentage | awk -F'[^0-9]*' '{print $2}'
