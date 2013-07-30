#!/bin/bash

# sym links
ln -s ~/dotfiles/vimrc ~/.vimrc;
ln -s ~/dotfiles/gitconfig ~/.gitconfig;
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global;
ln -s ~/dotfiles/zshrc ~/.zshrc;

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;

cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git && cd ~;

# install oh my zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
