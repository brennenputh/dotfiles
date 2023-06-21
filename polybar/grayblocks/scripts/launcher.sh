#!/usr/bin/env bash

rofi -no-config -no-lazy-grab -show drun -modi drun,ssh,run -theme ~/.config/polybar/grayblocks/scripts/rofi/launcher.rasi -ssh-command "kitty -- kitty +kitten ssh {host} [-p {port}]"
