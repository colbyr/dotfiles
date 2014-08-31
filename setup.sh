#!/bin/bash

# sym links
ln -fs ~/dotfiles/vimrc ~/.vimrc;
ln -fs ~/dotfiles/gitconfig ~/.gitconfig;
ln -fs ~/dotfiles/gitignore_global ~/.gitignore_global;

# create .zsh_profile for local config
touch ~/.zsh_profile

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git && cd ~;

# install oh my zsh
 curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
ln -fs ~/dotfiles/zshrc ~/.zshrc;
source ~/.zshrc
