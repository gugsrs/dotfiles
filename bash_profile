#bash-completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi

#Set architecture flags
#export ARCHFLAGS="-arch x86_64"
export TERM='xterm-256color'
export CLICOLOR=1

export GREP_OPTIONS='--color=auto'
#if [ "$VIRTUAL_ENV" != "" ]; then
#	venv="(${VIRTUAL_ENV##*/})"
#else
#	venv=''
#fi

__pyenv_version_ps1 ()
{
    local ret=$?;
    if [ -n "${PYENV_VIRTUAL_ENV}" ]; then
        echo -n "(${PYENV_VIRTUAL_ENV##*/}) "
    fi
    return $?
}
#time '\033[0;35m\]\t';
#user '';
#PS1='$(__pyenv_version_ps1)\[\033[0;96m\]\u \[\033[1;35m\]\w\[\033[0m\] \[\033[0m\]\n\$ '
PS1='\[\033[0m\033[0;32m\]$(__pyenv_version_ps1)\[\033[0m\033[0;96m\]\u \[\033[1;35m\]\w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;96m\]└─\[\033[0m\033[0;96m\] \$\[\033[0m\033[0;96m\] ▶\[\033[0m\] '

# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
#
## Setting PATH for Python 2.7
## The orginal version is saved in .bash_profile.pysave
#PATH="/usr/local/Cellar/python/2.7.9/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

# Python 3
PATH="/usr/local/Cellar/python3/3.5.1/bin:${PATH}"
export PATH

##Setting Go Source Folder
#GOROOT=$HOME/Documents/Development/go
#export GOROOT
#
##Setting Go Workspace
#GOPATH=$HOME/Documents/Development/GoWorkspace
#PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#export GOPATH
#export PATH

##GIT EDITOR
export GIT_EDITOR="/usr/local/Cellar/vim/7.4.979/bin/vim"
#alias wc-go="Documents/Development/GoWorkspace/bin/wc-go"

## fix encoding python
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export WORKON_HOME=$HOME/.envs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python3/3.5.1/bin/python3
# set where virutal environments will live
. /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
	
# aliases
alias grep="grep --color"
alias egrep="egrep --color"
alias less="less -Xr"
alias la="ls -a"
alias ll="ls -lah"
alias ls="ls -G"

alias vim="/usr/local/Cellar/vim/7.4.979/bin/vim"
#alias wc-go="Documents/Development/GoWorkspace/bin/wc-go"

#alias git
alias gs="git status"
alias gp="git push"
alias gl="git lg"
alias gpr="git pull --rebase"
alias gd="git diff"
alias gca="git commit --amend"

alias runpostgres="postgres -D /usr/local/var/postgres"

function finder { find ./ -name "$1" -exec grep "$2" {} + ;}

function rmds_store {
    find ./ -name ".DS_Store" -depth -exec rm {} \;
}

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH=$PATH:/Users/sikeira/mucca/mucca/scripts
alias sm="source ~/mucca/mucca/.venv/bin/activate"
source <(kubectl completion zsh)
eval "$(pyenv init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

function ve {
	pyenv activate ${PWD##*/};
}
function de {
	pyenv deactivate;
}
