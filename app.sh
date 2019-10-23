#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Globals
GIT_USER=bayareawebpro
GIT_PROJECTS_PATH="$HOME/Sites"

DIR="${0%/*}"

# Paths & Aliases
source $DIR/config.sh

# Git Commands
source $DIR/git-branch.sh
source $DIR/git-ignore.sh
source $DIR/git-initial.sh
source $DIR/git-origin.sh
source $DIR/git-readme.sh
source $DIR/git-report.sh
source $DIR/git-reset.sh
source $DIR/git-setup.sh
source $DIR/git-sync.sh

# Make Commands
source $DIR/make-database.sh
source $DIR/make-project.sh
source $DIR/make-laravel.sh

# Utilities
source $DIR/utility-logger.sh