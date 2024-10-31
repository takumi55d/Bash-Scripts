#!/bin/bash
# Made by Saifullah
# kali-chrome-remote-desktop.sh

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y sudo wget figlet micro git curl nano neovim neofetch htop xz-utils bpytop python3-pip nala

# Download and install Chrome Remote Desktop
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install -y ./chrome-remote-desktop_current_amd64.deb
rm ./chrome-remote-desktop_current_amd64.deb

# Install Kali Linux XFCE desktop environment
sudo apt install -y kali-desktop-xfce

# Add Brave browser repository and install Brave browser
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -y brave-browser

# Disable lightdm service
sudo systemctl disable lightdm.service

# Add a new user 'saifullah' and add to sudo group
sudo adduser saifullah
sudo usermod -aG sudo saifullah

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to bashrc and zshrc for both root and saifullah
for file in /root/.bashrc /root/.zshrc /home/saifullah/.bashrc /home/saifullah/.zshrc; do
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | sudo tee -a $file
done

# Source the shell files to apply changes
source /root/.bashrc
source /root/.zshrc
source /home/saifullah/.bashrc
source /home/saifullah/.zshrc

# Update Homebrew and install additional packages
brew update
brew install lolcat gcc helix

# Update Nala package manager
sudo nala update

# Display messages
echo "Chrome Remote Desktop and Kali Linux XFCE desktop environment installed and configured." | lolcat
figlet "Kali Linux is ready. Time to be a pro hacker" | lolcat
echo "Made by Saifullah" | lolcat

# Switch to user 'saifullah'
su - saifullah

# Uncomment the following line if Homebrew permissions need to be fixed
# sudo chown -R saifullah /home/linuxbrew/.linuxbrew/var/homebrew
 
