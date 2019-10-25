#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/app.sh"
source "$BASHER_PATH/app.sh"
logger:info "Test Run Ready..."

for FILE in $(directory:files "$BASHER_PATH/tests"); do
  if logger:confirm "Are you sure?"; then
    logger:info "Running TestCase $FILE."
    # shellcheck source=$FILE
    source "$FILE"
    logger:success "Completed."
  else
    logger:warning "Skipping..."
  fi
done