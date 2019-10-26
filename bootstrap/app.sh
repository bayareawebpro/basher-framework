#!/usr/bin/env bash
# ==== Core Bootstrap Methods ==========================================================================================

# Require file from directory.
function app:require() {
  # shellcheck source==$BASHER_PATH/app/$1
  source "$BASHER_PATH/app/$1"
}

# Require files in directory.
function app:require:all() {
  for ENTRY in "$BASHER_PATH/app/$1"/*.sh; do
    # shellcheck source="$ENTRY"
    source "$ENTRY"
  done
}

# ==== Methods that Depend on Core Utilities ===========================================================================

# ==== Boot Application ====
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

# ==== Reboot Command ====
function app:reboot() {
  # shellcheck source=$BASHER_PATH/app.sh
  clear && source "$BASHER_PATH/app.sh"
  logger:success "Reloaded!"
}

# ==== Test Application ====
function app:test() {
    # shellcheck source="$BASHER_PATH/tests/setup.sh"
    clear && source "$BASHER_PATH/tests/setup.sh"
}

# ==== Display Application Banner ====
function app:banner() {
  if $BASHER_BANNER; then
    logger:divider
    colors:red   '______  _______ _______ _     _ _______  ______'
    colors:green '|_____] |_____| |______ |_____| |______ |_____/'
    colors:blue  '|_____] |     | ______| |     | |______ |    \_ Version 1.x'
    logger:divider
  fi
}