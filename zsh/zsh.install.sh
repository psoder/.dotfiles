# 1. Install Zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
sudo apt-get install zsh -y
# Verify installation by running zsh --version. Expected result: zsh 5.0.8 or more recent
chsh -s $(which zsh)
# Log out
# Test that it worked with echo $SHELL. Expected result: /bin/zsh or similar.
# Test with $SHELL --version. Expected result: 'zsh 5.8' or similar


# 2. Install Oh My Zsh, https://ohmyz.sh/#install
export ZSH=$HOME/.dotfiles/zsh/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# 3. Powerlevel10k
# 3.1. Install fonts (https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

sudo apt-get install fonts-powerline -y

# 3.2. Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
exec zsh


# 4. Install plugins
sudo apt-get install autojump zsh-autosuggestions zsh-syntax-highlighting


# 5. Configuration
mv -f ~/.zshrc ~/.dotfiles/zsh/.zshrc.orig
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

mv -f ~/.p10k ~/.dotfiles/zsh/.p10k.orig
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh