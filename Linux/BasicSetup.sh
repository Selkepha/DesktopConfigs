#! /bin/bash

# A basic Ubuntu-Linux setup script, that applies my own personal configurations to GNOME desktops.

# Exit when any command fails
set -e

# Now upgrade and add applications
echo ----------------------------------------------
echo BasicSetup.sh \\ Upgrading packages...
echo ----------------------------------------------
sudo apt update
sudo apt upgrade
sudo apt install git vim firefox discord papirus-icon-theme gnome-tweaks gnome-shell-extension-manager htop focuswriter -y

# Make timeshift backup
echo ----------------------------------------------
echo BasicSetup.sh \\ Creating Timeshift backup...
echo ----------------------------------------------
sudo apt install timeshift -y
sudo timeshift --create --comments "First Backup"

# Add pop-shell
echo ----------------------------------------------
echo BasicSetup.sh \\ Installing GNOME extensions...
echo ----------------------------------------------
sudo apt install pop-shell pop-shell-shortcuts

# Configure GNOME Desktop
echo ----------------------------------------------
echo BasicSetup.sh \\ Configuring GNOME...
echo ----------------------------------------------
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true 
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
gsettings set org.gnome.desktop.peripherals.mouse speed 0.7

# Apply Papirus Icons

# ULauncher
echo ----------------------------------------------
echo BasicSetup.sh \\ Installing ULauncher...
echo ----------------------------------------------
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher

# Visual Studio Code
echo ----------------------------------------------
echo BasicSetup.sh \\ Installing Visual Studio Code...
echo ----------------------------------------------
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# Languages
#sudo apt install ibus ibus-anthy
# Must re-boot for ibus-anthy to take effect.
#reboot
#ibus-setup

echo ----------------------------------------------
echo BasicSetup.sh \\ Installing Flatpak...
echo ----------------------------------------------
sudo apt install Flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


echo ----------------------------------------------
echo BasicSetup.sh \\ Installing Obsidian...
echo ----------------------------------------------
flatpak install flathub md.obsidian.Obsidian

# Only-Office
echo ----------------------------------------------
echo BasicSetup.sh \\ Installing Only-Office...
echo ----------------------------------------------
flatpak install flathub org.onlyoffice.desktopeditors

# Dropbox
echo ----------------------------------------------
echo BasicSetup.sh \\ Installing Dropbox...
echo ----------------------------------------------
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &
cd ~/Downloads
wget https://www.dropbox.com/download?dl=packages/dropbox.py
mv download?dl=packages%2Fdropbox.py dropbox.py
mv dropbox.py ~/bin/dropbox.py
chmod 755 ~/bin/dropbox.py
~/bin/dropbox.py autostart y
~/bin/dropbox.py start
~/bin/dropbox.py status


