#!/usr/bin/env bash

# Update hombrew.
brew update
brew upgrade
brew cleanup

# Heroku plugins.
heroku plugins:update

# Update Mac apps.
mas upgrade
