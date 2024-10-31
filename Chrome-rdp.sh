#!/bin/bash

# Download and install Chrome Remote Desktop
sudo apt update
sudo apt install sudo nano wget -y
sudo apt upgrade -y
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install ./chrome-remote-desktop_current_amd64.deb -y
rm ./chrome-remote-desktop_current_amd64.deb

# Download and install Chrome Stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm ./google-chrome-stable_current_amd64.deb

# Install Xfce desktop environment
sudo DEBIAN_FRONTEND=interactive apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver

# Configure Xfce session for Chrome Remote Desktop
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

# Disable LightDM display manager
sudo systemctl disable lightdm.service

echo "Chrome Remote Desktop and Xfce desktop environment installed and configured."

