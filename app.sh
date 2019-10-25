#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Add Command Aliases
alias artisan='php artisan'

# Directory of this app's dependancies)
export BASHER_PATH="${0%/*}"

# Bootstrap
source "$BASHER_PATH/app/bootstrap.sh"

# Utilities
app:require:all utilities
app:require:all services
app:require:all commands
app:require:all installers

# Boot the Application
app:boot

# Declare Database Created Callback
#function on:database:created() {
#  local DB_NAME="$1";
#  logger:debug "on:database:created $DB_NAME (define function to use hook)"
#}

# Declare Laravel Installation Callback
#function on:laravel:install() {
#  local PROJECT="$1";
#  logger:text "Another Laravel Eh? Good choice!"
#  logger:debug "on:laravel:install (define function to use hook)"
#  #composer install my/fav-packages
#}

# Declare Laravel Created Callback
#function on:laravel:created() {
#  logger:celebrate "The web needs more apps like $1. Cool!"
#  logger:debug "on:laravel:created (define function to use hook)"
#  #local PROJECT="$1";
#  #local PROJECT="$(sudo valet tld)"
#  #chrome:serve "$PROJECT.local"
#}
