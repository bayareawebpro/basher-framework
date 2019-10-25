#!/usr/bin/env bash
echo "Remote Script Executing: $1"
echo "Args: $2 $3"

if [[ -f "$BASHER_PATH/app.sh" ]]; then
  # shellcheck source=$BASHER_PATH/app.sh
  source "$BASHER_PATH/app.sh"
  logger:success "Loaded Remote Script from Github."
fi