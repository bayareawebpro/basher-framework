#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Globals

# Paths & Aliases
APP_PATH="${0%/*}"
function app:require(){
  #echo "Loading: $APP_PATH/$1"
  source "$APP_PATH/$1"
}

# Git Commands
app:require config.sh
app:require git-branch.sh
app:require git-ignore.sh
app:require git-initial.sh
app:require git-origin.sh
app:require git-readme.sh
app:require git-report.sh
app:require git-reset.sh
app:require git-setup.sh
app:require git-sync.sh

# Utilities
app:require utility-logger.sh
app:require utility-chrome.sh


# Make Commands
app:require make-database.sh
app:require make-project.sh
app:require make-laravel.sh

# Install Commands
app:require install-animatecss.sh

# Run
logger:info "BashApp Loaded 😎"