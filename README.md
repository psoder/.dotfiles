# .dotfiles

## 1. Clone repo

```bash
# Using SSH
git clone git@github.com:psoder/.dotfiles.git

# Using HTTPS
git clone https://github.com/psoder/.dotfiles.git
```

## 2. Create symlinks

```bash
# Bash
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# SSH
ln -s ~/.dotfiles/config ~/.ssh/config

# Git
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# VS Code
ln -s ~/.dotfiles/settings.json ~/.config/Code/User/settings.json
```

## 3. Install Apps

```bash
# Snap
sudo apt-get install snapd

# Discord
snap install discord

# Steam
sudo apt-get install steam

# Slack
snap install slack

# Konsole
sudo apt-get install konsonsole

# Docker
./apps/docker.sh

# VS Code
./apps/vscode.sh
./apps/vscode-extensions.sh

# Node.js npm 
sudo apt-get install nodejs npm

# n
npm install -g n

# yarn
corepack enable


```
