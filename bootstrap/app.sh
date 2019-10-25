#!/usr/bin/env bash

# ==== Require / AutoLoader ====
function app:require:remote() {
  curl -s "$1" | bash -s "$*"
}
# Require file from directory.
function app:require() {
  local FILE="$BASHER_PATH/app/$1"
  if [[ ! -f "$FILE" ]]; then
    echo "[app:require] $1 doesn't exist." && return 1
  fi
  # shellcheck source="$FILE"
  source "$FILE"
}
# Require files in directory.
function app:require:all() {
  local DIR="$BASHER_PATH/app/$1"
  if [[ ! -d "$DIR" ]]; then
    echo "[app:require:all] $1 doesn't exist."
    return 1
  fi
  local DIR=("$DIR"/*)
  for ((i=0; i<${#DIR[@]}; i++)); do
    if [[ -f "${DIR[$i]}" ]]; then
      # shellcheck source="${DIR[$i]}"
      source "${DIR[$i]}"
    fi
  done
}

# ==== The Following Functions Depend on Core Utilities ====

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
  source "$BASHER_PATH/.env.default"
  if file:exists "$BASHER_PATH/.env"; then
    # shellcheck source=$BASHER_PATH/.env
    source "$BASHER_PATH/.env"
  else
    logger:warning "$BASHER_PATH/.env does not exist."
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