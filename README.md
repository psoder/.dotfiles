# .dotfiles

## 1 Clone repo

```bash
# Using SSH
git clone --recurse-submodules git@github.com:psoder/.dotfiles.git

# Using HTTPS
git clone --recurse-submodules https://github.com/psoder/.dotfiles.git

# Update HTTPS clone to SSH
# https://stackoverflow.com/questions/57230972/how-to-migrate-from-https-to-ssh-github
git remote set-url origin git@github.com:psoder/.dotfiles.git

# To update the sub-repos
git submodule update --init --recursive
```


## 2 Create symlinks
```
pacman -S extra/stow ghostty fish neovim fd bat eza dust starship git-delta ripgrep ripgrep-all tokei atuin zellij

pacman -S docker docker-compose chromium

curl https://mise.run | sh

pacman -S spotify-launcher
```

```sh
stow .
```

## 3 Install Apps

### 3.0 `zsh`

```sh
./scripts/zsh.install.sh
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
# Alacritty
sudo apt install alacritty

# tmux
./scripts/tmux.install.sh

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
./scripts/docker.install.sh

# VS Code
./scripts/vscode.install.sh

# NeoVim
curl -L -o ~/.local/bin/nvim  https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x ~/.local/bin/nvim

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
