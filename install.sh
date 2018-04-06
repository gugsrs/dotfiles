#!/usr/bin/env bash

# Install Xcode Command Line Tools.
xcode-select --install

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew basics (auto-updating).
brew install terminal-notifier
brew tap domt4/autoupdate
brew autoupdate --start --upgrade --cleanup --enable-notifications

# Install brew essentials.
brew install heroku
brew install git
brew install ack

# Install Heroku plugins.
heroku plugins:install heroku-sudo
heroku plugins:install heroku-repo
heroku plugins:install heroku-buildkits

# Install download utilities.
brew install youtube-dl
brew install wget
brew install httpie

# Install fancy shell stuff.
brew install grc
brew install thefuck
brew install mas
brew install htop

# Install Python utlitlies.
brew install python
brew install python@2
brew install pypy
brew install pypy3
brew install ipython

# Pipenv!
brew install pipenv

# Install git utilities.
brew install git-open
brew install gist

# Install other languages.
brew install lua
brew install node
brew install ruby

# Install fun stuff.
brew install fortune
brew install cowsay
brew install sl
gem install lolcat

# Install network utilities
brew install sshuttle
npm install --global speed-test

# Go stuff.
brew install go
brew install dep

# GPG stuff.
brew install gpg

# Neovim
brew install neovim

# tmux
brew install tmux

# aws
brew install awscli

# db
brew install postgresql
brew install pgcli

# nice tools
brew install jq
brew install pyenv
brew install pyenv-virtualenv
brew install reattach-to-user-namespace
brew install zsh-autosuggestions
brew install zsh-completions
