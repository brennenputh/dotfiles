#!/bin/sh

AVAILABLE_DEVICES=$(bluetoothctl devices Connected | awk '{print $3}')

echo "$AVAILABLE_DEVICES"
