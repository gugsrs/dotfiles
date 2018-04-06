setopt prompt_subst

export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}git%{$reset_color%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]?%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{+%G%}"

ZSH_THEME_VIRTUALENV_PREFIX=" workon %{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"

# This is the basic prompt that is always printed.  It will be
# enclosed to make it newline.
_GUGSRS_PROMPT='%{$fg[magenta]%}%n%{$reset_color%} in %{$fg[cyan]%}%~%{$reset_color%}%'

# This is the base prompt that is rendered sync.  It should be
# fast to render as a result.  The extra whitespace before the
# newline is necessary to avoid some rendering bugs.
PROMPT=$'\n'$_GUGSRS_PROMPT$' \n$ '
RPROMPT=''

# The pid of the async prompt process and the communication file
_GUGSRS_ASYNC_PROMPT=0
_GUGSRS_ASYNC_PROMPT_FN="/tmp/.zsh_tmp_prompt_$$"

# Remove the default git var update from chpwd and precmd to speed
# up the shell prompt.  We will do the precmd_update_git_vars in
# the async prompt instead
chpwd_functions=("${(@)chpwd_functions:#chpwd_update_git_vars}")
precmd_functions=("${(@)precmd_functions:#precmd_update_git_vars}")

# This here implements the async handling of the prompt.  It
# runs the expensive git parts in a subprocess and passes the
# information back via tempfile.
function _gugsrs_precmd() {
  _gugsrs_rv=$?

  function async_prompt() {
    # Run the git var update here instead of in the parent
    precmd_update_git_vars

    #
    echo -n $'\n'$_GUGSRS_PROMPT$' '$(git_super_status)' ' > $_GUGSRS_ASYNC_PROMPT_FN
	if [[ -n $(virtualenv_prompt_info) ]]; then
      echo -n $''$(virtualenv_prompt_info) $(python -V 2>&1| cut -f 2 -d ' ') >> $_GUGSRS_ASYNC_PROMPT_FN
	fi
    if [[ x$_gugsrs_rv != x0 ]]; then
      echo -n " exited %{$fg[red]%}$_gugsrs_rv%{$reset_color%}" >> $_GUGSRS_ASYNC_PROMPT_FN
    fi
    echo -n $' \n$ ' >> $_GUGSRS_ASYNC_PROMPT_FN

    # signal parent
    kill -s USR1 $$
  }

  # If we still have a prompt async process we kill it to make sure
  # we do not backlog with useless prompt things.  This also makes
  # sure that we do not have prompts interleave in the tempfile.
  if [[ "${_GUGSRS_ASYNC_PROMPT}" != 0 ]]; then
    kill -s HUP $_GUGSRS_ASYNC_PROMPT >/dev/null 2>&1 || :
  fi

  # start background computation
  async_prompt &!
  _GUGSRS_ASYNC_PROMPT=$!
}

# This is the trap for the signal that updates our prompt and
# redraws it.  We intentionally do not delete the tempfile here
# so that we can reuse the last prompt for successive commands
function _gugsrs_trapusr1() {
  PROMPT="$(cat $_GUGSRS_ASYNC_PROMPT_FN)"
  _GUGSRS_ASYNC_PROMPT=0
  zle && zle reset-prompt
}

# Make sure we clean up our tempfile on exit
function _gugsrs_zshexit() {
  rm -f $_GUGSRS_ASYNC_PROMPT_FN
}

# Hook our precmd and zshexit functions and USR1 trap
precmd_functions+=(_gugsrs_precmd)
zshexit_functions+=(_gugsrs_zshexit)
trap '_gugsrs_trapusr1' USR1
