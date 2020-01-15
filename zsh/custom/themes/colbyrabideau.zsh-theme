function node_prompt_version {
    if which node &> /dev/null; then
        echo "node:%{$fg_bold[red]%}$(node -v)%{$reset_color%} "
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜) "
local user="user:%{$fg_bold[red]%}$USER%{$reset_color%} "
PROMPT='$(git_prompt_info) $(node_prompt_version) ${user}
%{$fg[cyan]%}%c%{$reset_color%} ${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} "
