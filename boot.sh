#!/bin/bash -e

USER=$(whoami)

su -c "apt install vim git tmux sudo" root

wget "https://raw.githubusercontent.com/vpenkoff/dotfiles/master/gitconfig" -O ~/.gitconfig -nc
wget "https://raw.githubusercontent.com/vpenkoff/dotfiles/master/tmux.conf" -O ~/.tmux.conf -nc
wget "https://raw.githubusercontent.com/vpenkoff/dotfiles/master/vimrc" -O ~/.vimrc -nc

su -c "echo \"$USER ALL=(ALL:ALL) ALL\" | sudo tee /etc/sudoers.d/$USER" root
