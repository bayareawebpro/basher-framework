#!/usr/bin/env bash
echo "Remote Script Executing: $1"
echo "Args: $2 $3"

if [[ -d "$BASHER_PATH" ]] && cd "$BASHER_PATH"; then
  # shellcheck source=$BASHER_PATH/app.sh
  source "$BASHER_PATH/app.sh"
  logger:success "Loaded Remote Script from Github."
fi