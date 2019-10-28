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

# ==== Publish Files ====
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

# ==== Build MacOS App Bundle from Self ====
function app:build(){
  if path:is:directory ~/Desktop/Basher.app && logger:confirm "Delete Existing Build?"; then
    directory:force:remove ~/Desktop/Basher.app
    logger:success "Destroyed Previous Build."
  fi
  directory:make ~/Desktop/Basher.app/Contents/MacOS
  app:publish "bootstrap/basher" ~/Desktop/Basher.app/Contents/MacOS/basher
  file:make:executable ~/Desktop/Basher.app/Contents/MacOS/basher
  cp -rf "$BASHER_PATH" ~/Desktop/Basher.app/Contents/MacOS
  logger:success "Application Built Successfully @ ~/Desktop/Basher.app"

  if logger:confirm "Create Archive from Bundle?"; then
    logger:info "Creating Archive..."
    directory:archive ~/Desktop/Basher.app ~/Desktop/Basher.app.zip
    logger:success "Created Archive Basher.app.zip Successfully."
  fi
}