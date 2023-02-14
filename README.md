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
ln -s ~/.dotfiles/bash/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc

# zsh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# SSH
ln -s ~/.dotfiles/config ~/.ssh/config

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# VS Code
ln -s ~/.dotfiles/settings.json ~/.config/Code/User/settings.json
```

## 3. Install Apps

```bash
# thefuck
sudo apt install thefuck

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

# zsh
sudo apt-get install fonts-powerline -y
sudo apt-get install zsh -y
sh
sudo -s
which zsh
chsh -s /usr/bin/zsh
sudo apt-get install autojump zsh-autosuggestions zsh-syntax-highlighting

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Docker
./apps/docker.sh

# VS Code
./apps/vscode.sh
./apps/vscode-extensions.sh


# n, npm and Node
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
# Now node and npm are available
npm install -g n

# LSD
# TODO

# Highlight
sudo apt install highlight

# tree
sudo apt install tree

# Powerlevel10k
# 1. Install font
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# 2. Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

## Install SDK apps
sdk install kotlinc
sdk install ki
```
