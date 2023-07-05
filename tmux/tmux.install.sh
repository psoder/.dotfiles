mv -f ~/.tmux ~/.dotfiles/tmux/tmux.orig
mv -f ~/.tmux.conf ~/.dotfiles/tmux/tmux.conf.orig
ln -s ~/.dotfiles/tmux ~/.tmux
ln -s ~/.dotfiles/tmux/tmux.conf  ~/.tmux.conf

sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/tmux/plugins/tpm
