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
pacman -S yay extra/stow \
    ghostty \
    fish \
    neovim \
    fd \
    bat \
    eza \
    dust \
    starship \
    git-delta \
    ripgrep \
    ripgrep-all \
    tokei atuin \
    zellij \
    zoxide \
    inetutils \
    keychain \
    zen-browser-bin \
    sudo \
    mise \
    yazi \
    wl-clipboard \
    openssh \
    tealdeer \
    mprocs \
    watchexec \
    xdg-terminal-exec \
    imageglass \
    evince

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
    ashell-bin \
    kitty \
    greetd \
    sysc-greet-cagebreak


yay -S bash-language-server
```

```sh
stow .
```

## Login manager (greetd + sysc-greet)

`sysc-greet-cagebreak` ships working defaults into `/etc/greetd/`, but the source of truth for these three files is kept here so they're tracked with the rest of the dotfiles. The greeter terminal is kept as kitty (the package default) rather than Ghostty — Ghostty is a GTK4/libadwaita app that needs a D-Bus session bus and `XDG_RUNTIME_DIR`, neither of which exist for the minimal `greeter` pseudo-session, so it fails to start and leaves a blank screen. Kitty talks to Wayland directly with no such dependency.

These are **copied**, not symlinked, into `/etc/greetd/` — `greeter` (a system user) can't traverse into a normal `700` home directory to follow a symlink back to `~/.dotfiles`, and loosening home directory permissions just to allow that isn't worth it for three small config files. After installing the packages above and stowing, back up the package-installed files and copy in the repo's versions:

```sh
sudo mv /etc/greetd/config.toml /etc/greetd/config.toml.pacsave
sudo mv /etc/greetd/cagebreak-greeter-config /etc/greetd/cagebreak-greeter-config.pacsave
sudo mv /etc/greetd/kitty.conf /etc/greetd/kitty.conf.pacsave

sudo cp ~/.dotfiles/.config/greetd/config.toml /etc/greetd/config.toml
sudo cp ~/.dotfiles/.config/greetd/cagebreak-greeter-config /etc/greetd/cagebreak-greeter-config
sudo cp ~/.dotfiles/.config/greetd/kitty.conf /etc/greetd/kitty.conf

sudo chown root:root /etc/greetd/config.toml /etc/greetd/cagebreak-greeter-config /etc/greetd/kitty.conf
sudo chmod 644 /etc/greetd/config.toml /etc/greetd/cagebreak-greeter-config /etc/greetd/kitty.conf
```

**Re-run the `cp`/`chown`/`chmod` block above any time you edit these files in the repo** — since they're plain copies, changes don't take effect until you re-copy them.

The `greetd.service` systemd unit is enabled automatically by the AUR package install (it conflicts with `getty@tty1.service`, so it takes over that VT on boot). Verify the copied config works — e.g. `sudo systemctl restart greetd` from another VT, or simply reboot — before relying on it.
