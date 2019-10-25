#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/app.sh"
source "$BASHER_PATH/app.sh"
logger:info "Test Run Ready..."

for FILE in $(directory:files "$BASHER_PATH/tests/unit"); do
  logger:divider
  if logger:confirm "Run $(basename "$FILE")?"; then
    logger:info "Running TestCase $FILE."
    # shellcheck source=$FILE
    source "$FILE"
  fi
done