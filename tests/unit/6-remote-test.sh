#!/usr/bin/env bash
SCRIPT="https://raw.githubusercontent.com/bayareawebpro/basher-framework/master/tests/mocks/remote-mock.sh"

remote:require "$SCRIPT" myVar
assert:truthy "remote:require"

if str:filled "$BASHER_CI"; then
  logger:warning "Skipping, no ping available..."
  continue
fi

remote:ping "https://raw.githubusercontent.com"
assert:truthy "remote:ping"