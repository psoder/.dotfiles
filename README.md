# .dotfiles

## 1 Clone repo

```bash
# Using SSH
git clone git@github.com:psoder/.dotfiles.git

# Using HTTPS
git clone https://github.com/psoder/.dotfiles.git
```

## 2 Create symlinks

```bash
# Bash
# mv -f ~/.bash_aliases ~/.bash_aliases.orig
# ln -s ~/.dotfiles/bash/.bash_aliases ~/.bash_aliases
# mv -f ~/./bash/. ~/..bashrc.orig
# ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc

# SSH
mv -f ~/.ssh/config ~/.dotfiles/ssh/config.orig
ln -s ~/.dotfiles/ssh/ssh.config ~/.ssh/config

# Git
mv -f ~/.gitconfig ~/.dotfiles/git/.gitconfig.orig
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

# Vim
mv -f ~/.vim ~/.dotfiles/vim/.vim.orig
ln -s ~/.dotfiles/vim ~/.vim

# Neovim
mv -f ${XDG_CONFIG_HOME:-$HOME/.config}/nvim ~/.dotfiles/nvim/nvim.orig
ln -s ~/.dotfiles/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
```

## 3 Install Apps

### 3.0 `Zsh`

```sh
~/.dotfiles/zsh/zsh.install.sh
```

### 3.1 Flatpak

```sh
# https://flatpak.org/setup
# Using apt
sudo apt install flatpak

# Reboot after, https://flathub.org/setup
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

### 3.1 Tools

```sh
#tmux
~/.dotfiles/tmux/tmux.install.sh

# VLC
flatpak install flathub org.videolan.VLC

# Postman
flatpak install flathub com.getpostman.Postman

# GIMP
flatpak install flathub org.gimp.GIMP

# Chromium
flatpak install flathub org.chromium.Chromium

# Calibre
flatpak install flathub com.calibre_ebook.calibre

# qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent

# Docker
./apps/docker.sh

# VS Code
./vscode/vscode.install.sh

# NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# tree
sudo apt install tree

# n, npm and Node (https://github.com/tj/n/)
export N_PREFIX=$HOME/.dotfiles/js/n
# https://github.com/mklement0/n-install
curl -L https://raw.githubusercontent.com/mklement0/n-install/stable/bin/n-install | bash -s -- -y
source ~/.zshrc

mv -f ~/.npm ~/.dotfiles/js/npm.orig
ln -s ~/.dotfiles/js/npm ~/.npm

mv -f ~/.npmrc ~/.dotfiles/js/.npmrc.orig
ln -s ~/.dotfiles/js/npm/.npmrc ~/.npmrc

mv -f ~/.npm-init.js ~/.dotfiles/js/.npm-init.js.orig
ln -s ~/.dotfiles/js/npm/.npm-init.js ~/.npm-init.js

# piper
sudo apt install ratbagd
flatpak install flathub org.freedesktop.Piper
```

### 3.2 Entertainment

```sh
# Spotify
flatpak install flathub com.spotify.Client

# Steam
flatpak install flathub com.valvesoftware.Steam

# Lutris
flatpak install flathub net.lutris.Lutris
```

### 3.3 Communication

```sh
# Telegram
flatpak install flathub org.telegram.desktop

# Discord
flatpak install flathub com.discordapp.Discord

# Slack
flatpak install flathub com.slack.Slack
```
