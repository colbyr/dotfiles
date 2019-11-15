function node_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}n(%{$fg[gray]%}%{$reset_color%}$(node -v)%{$fg_bold[blue]%})%{$reset_color%} "
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜) "
PROMPT='$(node_prompt_version)${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}g(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "
