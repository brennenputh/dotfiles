#!/bin/sh
# Returns 1 if this is a WSL environment, 0 otherwise.

FILE=/proc/sys/fs/binfmt_misc/WSLInterop
if [ -f $FILE ]; then
  exit 1
else
  exit 0
fi
