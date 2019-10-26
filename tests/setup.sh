#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/app.sh"
source "$BASHER_PATH/app.sh"

# Test Assertions
function assert:truthy() {
  if func:success; then
    logger:success "Assert: $1 true/Successful."
    else
    logger:failed "Assert: $1 true/Successful. (pausing 5 seconds)"
    sleep 5
  fi
}
function assert:falsy() {
  if func:failed; then
    logger:success "Assert: $1 false/Failed."
    else
    logger:failed "Assert: $1 false/Failed. (pausing 5 seconds)"
    sleep 5
  fi
}

#Test Loader
function run:test() {
  for FILE in $(directory:files "$BASHER_PATH/tests/unit"); do
    logger:divider
    local CASE="$(basename "$FILE")"
    if logger:confirm "Run TestCase $CASE?"; then
      logger:info "Running TestCase $CASE..."
      # shellcheck source=$FILE
      source "$FILE"
    fi
  done
}

# Test Run
logger:info "Test Run Ready..."
run:test