#bash-completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
fi

#Set architecture flags
#export ARCHFLAGS="-arch x86_64"
export TERM='xterm-256color'
export CLICOLOR=1

export GREP_OPTIONS='--color=auto'
PS1='\[\033[0;96m\]\u \[\033[1;35m\]\w\[\033[0m\] \[\033[0m\]\n\$ '
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/local/Cellar/python/2.7.9/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

#Setting Go Source Folder
GOROOT=$HOME/Documents/Development/go
PATH=$PATH:$GOROOT/bin
export GOROOT
export PATH
#Setting Go Workspace
GOPATH=$HOME/Documents/Development/GoWorkspace
PATH=$PATH:$GOPATH/bin
export GOPATH
export PATH

#GIT EDITOR
export GIT_EDITOR="/usr/local/Cellar/macvim/7.4-74/MacVim.app/Contents/MacOS/Vim"

# aliases
alias grep="grep --color"
alias egrep="egrep --color"
alias less="less -Xr"
alias la="ls -a"
alias ll="ls -lah"
alias ls="ls -G"

#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/usr/local/Cellar/macvim/7.4-74/MacVim.app/Contents/MacOS/Vim"
alias wc-go="Documents/Development/GoWorkspace/bin/wc-go"

#alias git
alias gs="git status"
alias gp="git push"
alias gl="git lg"
alias gpr="git pull --rebase"
alias gd="git diff"

function finder { find ./ -name "$1" -exec grep "$2" {} + ;}
