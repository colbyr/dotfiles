# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

# set vim as the default editor
export EDITOR=$(which vim)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile
