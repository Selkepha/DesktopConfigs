#! /bin/bash

# A basic Ubuntu-Linux setup script, that applies my own personalconfigurations

# Configure GNOME Desktop
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Make timeshift backup
sudo apt update
sudo apt install timeshift -y
sudo timeshift --create --comments "First Backup"

# Now upgrade and add applications
sudo apt upgrade
sudo apt install git vim firefox discord papirus-icon-theme gnome-tweaks gnome-shell-extension-manager htop -y

# Visual Studio Code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Add pop-shell and disable window titles

