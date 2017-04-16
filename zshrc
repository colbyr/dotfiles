# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# plugins=(git)

# set vim as the default editor
export EDITOR=$(which vim)

alias g="git"
alias gnp="git --no-pager"
alias vimsplat="xargs -o vim -O"
alias tmyx="tmux"

# load the profile first so we can override the zsh theme!
source ~/.zsh_profile

source $ZSH/oh-my-zsh.sh

alias ll="ls -AFhlo"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="$HOME/dotfiles/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
