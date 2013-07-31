# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# nodejs
export NODE_PATH="/usr/local/lib/node"

# ruby
eval "$(rbenv init -)"

# aliases
alias etsy="mosh crabideau@crabideau.vm.ny4dev.etsy.com"
alias mber_dev="mosh colby@192.81.215.35"
alias mber="ssh kfgp3@10.13.8.134"
alias nrs="mosh colby@198.199.121.175"

# Customize to your needs...
export PATH=/usr/local/share/npm/bin:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/narwhal/bin:$PATH

export GITHUB_USER="colbyr"
export GITHUB_PASSWORD="h0b0j0t0"

export NARWHAL_ENGINE=jsc

export CAPP_BUILD="/Users/colby/Build"

alias art="php artisan"

# Python
PATH="/usr/local/share/python:$PATH"

source ~/.zsh_profile
