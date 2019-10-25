#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Directory of this app's dependancies)
export BASHER_PATH="${0%/*}"

# Reboot Command
function app:reboot() {
  source "$BASHER_PATH/app.sh"
  logger:success "Reloaded!"
}

# Require Command
function app:require() {
  if [[ -f "$BASHER_PATH/$1" ]]; then
    source "$BASHER_PATH/$1"
  else
    echo "app:require: $BASHER_PATH/$1 does not exist."
  fi
}

# Require Remote Command
function app:require:remote() {
  curl -s "$1" | bash -s "$2"
}

# Utilities
app:require utility-conditionals.sh
app:require utility-filesystem.sh
app:require utility-installer.sh
app:require utility-logger.sh

# Install Commands
app:require install-animatecss.sh

# Services
app:require services-codequality.sh
app:require services-phpstorm.sh
app:require services-chrome.sh

# Git Commands
app:require git-initial.sh
app:require git-branch.sh
app:require git-ignore.sh
app:require git-origin.sh
app:require git-readme.sh
app:require git-report.sh
app:require git-reset.sh
app:require git-setup.sh
app:require git-sync.sh

# Make Commands
app:require make-database.sh
app:require make-project.sh
app:require make-laravel.sh

# Environment Overrides
app:require env.default.sh
app:require env.sh

# Application Banner
if string:not:empty "$BASHER_BANNER"; then
  logger:divider
  colors:red    '______  _______ _______ _     _ _______  ______'
  colors:green  '|_____] |_____| |______ |_____| |______ |_____/'
  colors:blue   '|_____] |     | ______| |     | |______ |    \_'
  colors:white  'Version 1.x'
  logger:info "Loaded & Ready for Commands."
  logger:divider
fi

