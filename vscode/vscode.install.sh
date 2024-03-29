#!/bin/bash

# Add Microsoft key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Install VS Code
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

mv -f ~/.config/Code/User/settings.json ~/.dotfiles/vscode/settings.json.orig
ln -s ~/.dotfiles/vscode/vscode.settings.json ~/.config/Code/User/settings.json
