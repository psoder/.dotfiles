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

# Install extensions
extensions=(
  CoenraadS.bracket-pair-colorizer
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  ecmel.vscode-html-css
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  ms-azuretools.vscode-docker
  oderwat.indent-rainbow
  redhat.vscode-yaml
  VisualStudioExptTeam.vscodeintellicode
)

for i in ${extensions[@]}; do
  code --install-extension $i
done