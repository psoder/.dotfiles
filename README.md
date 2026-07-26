# .dotfiles

## Clone repo

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

## `.dotfiles`

```bash
stow -d ~/.dotfiles -t $HOME .
```


## Arch install

```sh
pacman -S yay extra/stow ghostty fish neovim fd bat eza dust starship git-delta ripgrep ripgrep-all tokei atuin zellij zoxide inetutils keychain zen-browser-bin sudo mise yazi wl-clipboard openssh tealdeer mprocs watchexec xdg-terminal-exec imageglass

pacman -S brightnessctl networkmanager pipewire wireplumber pwvucontrol gnome-keyring

pacman -S docker docker-compose chromium moon

curl https://mise.run | sh

pacman -S spotify-launcher obsidian vlc

yay -S hyprland \
    swaync \
    hypridle \
    hyprpaper \
    hyprshot \
    hyprlock \
    hyprcursor \
    hyprpolkitagent \
    hyprlauncher \
    hyprshutdown \
    catppuccin-cursors-macchiato \
    xdg-desktop-portal-hyprland \
    hyprpwcenter \
    hyprland-qt-support \
    qt5-wayland \
    qt6-wayland \
    ashell-bin
```

```sh
stow .
```
