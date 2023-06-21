#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/grayblocks"

# Terminate already running bar instances
killall -q polybar

sleep 1

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
