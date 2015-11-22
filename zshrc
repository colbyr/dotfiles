# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

# set vim as the default editor
export EDITOR=$(which nvim)

alias nvimsplat="xargs -o nvim -O"
alias gnp="git --no-pager"
alias tmyx="tmux"

# load the profile first so we can override the zsh theme!
source ~/.zsh_profile

source $ZSH/oh-my-zsh.sh
