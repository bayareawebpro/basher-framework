#!/usr/bin/env bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# CheatSheet: https://devhints.io/bash

# Require Files
# shellcheck source="$BASHER_PATH/bootstrap/app.sh"
source "$BASHER_PATH/bootstrap/app.sh"
app:require:all installers
app:require:all utilities
app:require:all services
app:require:all commands

# Boot the Application
app:boot
