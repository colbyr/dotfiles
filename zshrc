# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# nodejs
export NODE_PATH="/usr/local/lib/node"

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin:$PATH
