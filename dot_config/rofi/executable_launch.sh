#!/bin/bash

args=("-show" "combi")

if "$HOME"/.local/bin/focus-mode -c; then
  args+=("-drun-exclude-categories" "Game,InstantMessaging")
fi

rofi "${args[@]}"
