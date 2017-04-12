PYENV_PROMPT_DEFAULT_VERSION=${PYENV_PROMPT_DEFAULT_VERSION:="system"}

function _pyenv_prompt_info {
    [[ -n $(whence pyenv_prompt_info) ]] && \
        [[ "$(pyenv_prompt_info)" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]] && \
        echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}
local ret_status="%(?:%{$fg_bold[cyan]%}└─⚡ :%{$fg_bold[red]%}└─⚡ )"
local in_status="%(?:%{$fg_bold[cyan]%}┌─:%{$fg_bold[red]%}┌─)"
PROMPT='${in_status}$(_pyenv_prompt_info) %{$fg[cyan]%}%c $(git_prompt_info) ${NEWLINE}${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
ZSH_THEME_PYENV_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg_bold[magenta]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$fg[blue]%})"
NEWLINE=$'\n'
