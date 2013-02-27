#!/bin/bash

# sym links
ln -s ~/dotfiles/vimrc ~/.vimrc;
ln -s ~/dotfiles/gitconfig ~/.gitconfig;
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global;

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;

cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git && cd ~;
