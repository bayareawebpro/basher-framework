#!/usr/bin/env bash
if str:empty "$BASHER_DB_USER"; then
  logger:warning "Skipping: BASHER_DB_USER not configured."
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