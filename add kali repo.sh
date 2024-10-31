#!/bin/bash

# Add Kali Linux repository to sources.list
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee -a /etc/apt/sources.list

# Import Kali Linux repository key
wget -q -O - https://archive.kali.org/archive-key.asc | sudo gpg --import

# Update package list
sudo apt update

# Install Kali Linux keyring package
sudo apt install kali-archive-keyring

# Upgrade the system
sudo apt upgrade
