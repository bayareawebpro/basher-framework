#!/usr/bin/env bash
echo "Remote Script Executing: $1"
echo "Args: $2 $3"

if [[ -d "$BASHER_PATH" ]] && cd "$BASHER_PATH"; then
  # shellcheck source=$BASHER_PATH/app.sh
  source "$BASHER_PATH/bootstrap/app.sh"
  # Utilities
  app:require:all utilities
  app:require:all services
  app:require:all commands
  app:require:all installers
  # Boot the Application
  app:boot
  logger:success "Loaded Remote Script from Github."
fi