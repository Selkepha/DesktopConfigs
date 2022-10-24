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
sudo apt install git vim firefox discord papirus-icon-theme gnome-tweaks gnome-shell-extension-manager htop
