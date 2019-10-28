#!/usr/bin/env bash

if str:filled "$BASHER_CI"; then
  logger:warning "Skipping, no MacOS available..."
  continue
fi

RESPONSE=$(os:confirm "Are you sure?" "Continue?")
assert:truthy "os:confirm"

str:is:equal "$RESPONSE" "OK"
assert:truthy "os:confirm str:is:equal OK"

os:notify "yo" "we up"
assert:truthy "os:notify"

os:speak "yo" "we up"
assert:truthy "os:speak"