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

