#!/bin/bash

. /etc/os-release

case $ID in 
  ubuntu) 
    INSTALL_CMD='apt install'
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
    sudo apt update
    ;;

  arch) 
    if ! command -v 'pikaur' &> /dev/null; then
      echo "Could not find pikaur.  Please install it and try again."
      exit 1
    fi
    INSTALL_CMD='pikaur -S'
    pikaur -Syu
    ;;

  *)
    echo "Could not identify system as any supported distribution. (WSL Ubuntu, Arch Linux)"
    exit 1
    ;;
esac

$INSTALL_CMD fish neovim fastfetch htop

# Shell
echo "Setting up fish..."
chsh -s /usr/bin/fish

# GUI Components (desktop systems only, not on WSL)
WSL_FILE=/proc/sys/fs/binfmt_misc/WSLInterop
if ! [ -f $WSL_FILE ]; then
  # i3, kitty, polybar, rofi
  $INSTALL_CMD i3 kitty polybar rofi picom
fi
