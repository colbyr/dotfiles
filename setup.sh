#!/bin/bash

# sym links
ln -fs ~/dotfiles/vimrc ~/.vimrc;
ln -fs ~/dotfiles/gitconfig ~/.gitconfig;
ln -fs ~/dotfiles/gitignore_global ~/.gitignore_global;

# create profiles for local config
touch ~/.vim_plugins
touch ~/.vim_profile
touch ~/.zsh_profile

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install oh my zsh
 curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
ln -fs ~/dotfiles/zshrc ~/.zshrc;
source ~/.zshrc
