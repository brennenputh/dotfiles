#!/bin/python3

import os
from pathlib import Path

print("Installing configuration files via symlink.")

is_gui = input("Is this system a GUI system? [y/N]: ").lower() == "y"

configuration_files = ['fish', 'nvim', 'fastfetch', 'htop']
if is_gui:
    configuration_files += ['i3', 'kitty', 'polybar', 'rofi', 'picom.conf', 'dunst']

for file in configuration_files:
    try:
        full_path = Path(file).absolute()
        os.symlink(full_path, os.getenv('HOME') + '/.config/' + file)
    except:
        print("Unable to symlink " + file + " directory.")

try:
    os.mkdir(os.getenv("HOME") + "/bin/")
except FileExistsError:
    print("Bin dir already exists.")
try:
    os.symlink(Path("./scripts/detect_wsl.sh").absolute(), os.getenv('HOME') + '/bin/detect_wsl')
except:
    print("Unable to symlink detect_wsl script.")
