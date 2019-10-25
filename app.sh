#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Directory of this app's dependancies)
export BASHER_PATH="${0%/*}"

# Bootstrap
source "$BASHER_PATH/app/bootstrap.sh"

# Utilities
app:require utilities/conditionals.sh
app:require utilities/filesystem.sh
app:require utilities/installer.sh
app:require utilities/processes.sh
app:require utilities/logger.sh

# Services
app:require services/codequality.sh
app:require services/phpstorm.sh
app:require services/chrome.sh
app:require services/github.sh

# Make Commands
app:require commands/make-database.sh
app:require commands/make-project.sh
app:require commands/make-laravel.sh

# Install Commands
app:require installers/animatecss.sh
app:require installers/tailwindcss.sh
app:require installers/vuejs.sh

# Boot the Application
app:boot

# Add Command Aliases
alias artisan='php artisan'

for FILE in $(directory:files "."); do
  logger:text "$FILE loaded"
done
# Database Created Callback
#function on:database:created() {
#  local DB_NAME="$1";
#  logger:debug "on:database:created $DB_NAME (define function to use hook)"
#}

# Laravel Installation Callback
#function on:laravel:install() {
#  local PROJECT="$1";
#  logger:text "Another Laravel Eh? Good choice!"
#  logger:debug "on:laravel:install (define function to use hook)"
#  #composer install my/fav-packages
#}

# Laravel Created Callback
#function on:laravel:created() {
#  logger:celebrate "The web needs more apps like $1. Cool!"
#  logger:debug "on:laravel:created (define function to use hook)"
#  #local PROJECT="$1";
#  #local PROJECT="$(sudo valet tld)"
#  #chrome:serve "$PROJECT.local"
#}
