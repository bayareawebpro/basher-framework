#!/usr/bin/env bash

# ==== Bootstrap Require ====
function app:require() {
  # shellcheck source=$BASHER_PATH/app/$1
  if [[ -f "$BASHER_PATH/app/$1" ]]; then
    source "$BASHER_PATH/app/$1"
  else
    echo "app:require: $BASHER_PATH/app/$1 does not exist."
  fi
}

# ==== The Following Functions Depend on Core Utilities ====

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
  # shellcheck source=$BASHER_PATH/app.sh
  clear && source "$BASHER_PATH/app.sh"
  logger:success "Reloaded!"
}

# Publish Resource
function app:publish() {
  if path:is:file "$2"; then
    logger:info "$2 already exists."
  elif file:exists "$BASHER_PATH/$1" && file:copy "$BASHER_PATH/$1" "$2"; then
    logger:success "Published $BASHER_PATH/$1 => $2 completed."
  else
    logger:failed "Publishing $BASHER_PATH/$1 => $2 failed."
    return 1
  fi
}

# Boot Application
function app:boot() {
  # shellcheck source=$BASHER_PATH/env.default.sh
  source "$BASHER_PATH/env.default.sh"
  if file:exists "$BASHER_PATH/env.sh"; then
    # shellcheck source=$BASHER_PATH/env.sh
    source "$BASHER_PATH/env.sh"
  else
    logger:warning "$BASHER_PATH/env.sh does not exist."
  fi
  app:banner
}

# Test Application
function app:test() {
    # shellcheck source=$BASHER_PATH/tests/setup.sh
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