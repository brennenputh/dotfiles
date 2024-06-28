#!/bin/python3

import os
import subprocess
from pathlib import Path

os_release = {}
with open('/etc/os-release') as f:
    for line in f:
        key, _, value = line.strip().partition('=')
        os_release[key] = value.strip('"')

print("Attempting to install required software...")

# Determine package manager and update system
if os_release['ID'] == 'ubuntu':
    INSTALL_CMD = 'sudo apt install -y'
    subprocess.run(['sudo', 'add-apt-repository', 'ppa:zhangsongcui3371/fastfetch'])
    subprocess.run(['sudo', 'apt', 'update'])
elif os_release['ID'] == 'arch':
    if not subprocess.run(['command', '-v', 'pikaur'], capture_output=True).returncode == 0:
        print("Could not find pikaur. Please install it and try again.")
        exit(1)
    INSTALL_CMD = 'pikaur -S --noconfirm'
    subprocess.run(['pikaur', '-Syu', '--noconfirm'])
else:
    print("Could not identify system as any supported distribution. (WSL Ubuntu, Arch Linux)")
    exit(1)

packages = ['fish', 'neovim', 'fastfetch', 'htop']
subprocess.run([INSTALL_CMD] + packages)

print("Setting fish as default shell, may prompt for auth.")
subprocess.run(["chsh", "-s", "/usr/bin/fish"])

is_gui = bool(input("Is this a system with a GUI?  Answer True or False."))

gui_packages = []
if is_gui:
    print("Installing GUI packages")
    gui_packages = ['i3', 'kitty', 'polybar', 'rofi', 'picom', 'dunst']
    subprocess.run([INSTALL_CMD] + gui_packages)

print("Installing configuration files via symlink.")

configuration_files = ['fish', 'nvim', 'fastfetch', 'htop']
if is_gui:
    configuration_files += ['i3', 'kitty', 'polybar', 'rofi', 'picom.conf', 'dunst']

for file in configuration_files:
    full_path = Path(file)
    os.symlink(full_path, '~/.config/' + file)

os.mkdir("~/bin/")
os.symlink(Path("./scripts/detect_wsl.sh"), '~/bin/detect_wsl')
