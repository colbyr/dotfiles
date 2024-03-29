#!/bin/bash


# sym links
ln -fs ~/dotfiles/vim/vimrc ~/.vimrc;
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf;
ln -fs ~/dotfiles/finicky.js ~/.finicky.js;

mkdir -p ~/.config/nvim
ln -fs ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim;

# install homebrew
ln -fs ~/dotfiles/Brewfile ~/Brewfile;
cd ~
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle

# git
ln -fs ~/dotfiles/git/ignore_global ~/.gitignore_global
cp ~/dotfiles/git/config_defaults ~/.gitconfig

# create profiles for local config
touch ~/.vim_plugins
touch ~/.vim_profile
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install oh my zsh
cp ~/dotfiles/zsh/rc_defaults ~/.zshrc
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

if [ -f ~/.zshrc ]
then
  echo "$(cat ~/dotfiles/zsh/rc_defaults)\n\n$(cat ~/.zshrc)" > ~/.zshrc
else
  cp ~/dotfiles/zsh/rc_defaults ~/.zshrc
fi

source ~/.zshrc
