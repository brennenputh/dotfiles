#!/bin/sh

TITLE=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)

if test -n "$TITLE" && test -n "$ARTIST"; then
  echo $TITLE "-" $ARTIST
fi
