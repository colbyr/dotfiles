#!/bin/bash

# sym links
ln -fs ~/dotfiles/vim/vimrc ~/.vimrc;
ln -fs ~/dotfiles/git/config ~/.gitconfig;
ln -fs ~/dotfiles/git/ignore_global ~/.gitignore_global;
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf;

# create profiles for local config
touch ~/.git_profile
touch ~/.vim_plugins
touch ~/.vim_profile
touch ~/.zsh_profile

# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins in (neo)vim
vim +PluginInstall +qall
nvim +PluginInstall +qall

# install oh my zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
ln -fs ~/dotfiles/zshrc ~/.zshrc;
source ~/.zshrc
