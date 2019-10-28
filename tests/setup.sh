#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/app.sh"
source "$BASHER_PATH/app.sh"

# Test Assertions
function assert:truthy() {
  if func:success; then
    logger:success "Assert: $1 true/Successful."
    sleep 0.1
    else
    logger:failed "Assert: $1 true/Successful."
    sleep 0.1
    return 1
  fi
}
function assert:falsy() {
  if func:failed; then
    logger:success "Assert: $1 false/Failed."
    sleep 0.1
    else
    logger:failed "Assert: $1 false/Failed."
    sleep 0.1
    return 1
  fi
}

#Test Loader
function run:test() {
  for FILE in $(directory:files "$BASHER_PATH/tests/unit"); do
    #logger:divider
    local CASE="$(basename "$FILE")"
    if str:filled "$BASHER_CONFIRM_TESTS"; then
      if logger:confirm "Run TestCase $CASE?"; then
        logger:info "Running TestCase $CASE..."
        # shellcheck source=$FILE
        source "$FILE"
      fi
    else
      logger:info "Running TestCase $CASE..."
      # shellcheck source=$FILE
      source "$FILE"
    fi
  done
}

# Test Run
logger:info "Test Run Ready..."
run:test