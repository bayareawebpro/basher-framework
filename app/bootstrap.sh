#!/usr/bin/env bash

# ==== Bootstrap Functions ====

# Require Command
function app:require() {
  if [[ -f "$BASHER_PATH/app/$1" ]]; then
    source "$BASHER_PATH/app/$1"
  else
    echo "app:require: $BASHER_PATH/app/$1 does not exist."
  fi
}

# Source Remote Script
function app:require:remote() {
  if func:exists "curl"; then
    curl -s "$1" | bash -s "$2"
  else
    logger:failed "Curl is not installed."
  fi
}

# Reboot Command
function app:reboot() {
  clear
  source "$BASHER_PATH/app.sh"
  logger:success "Reloaded!"
}

# ==== The Following Functions Depend on Core Utilities ====

# Boot Application
function app:boot() {
  source "$BASHER_PATH/env.default.sh"
  if file:exists "$BASHER_PATH/env.sh"; then
    source "$BASHER_PATH/env.sh"
  else
    logger:warning "$BASHER_PATH/env.sh does not exist."
  fi
  app:banner
}

# Test Application
function app:test() {
    source "$BASHER_PATH/tests/setup.sh"
}

# Display Application Banner
function app:banner() {
  if string:not:empty "$BASHER_BANNER"; then
    logger:divider
    colors:red    '______  _______ _______ _     _ _______  ______'
    colors:green  '|_____] |_____| |______ |_____| |______ |_____/'
    colors:blue   '|_____] |     | ______| |     | |______ |    \_'
    colors:white  'Version 1.x'
    logger:info "Loaded & Ready for Commands."
    logger:divider
  fi
}