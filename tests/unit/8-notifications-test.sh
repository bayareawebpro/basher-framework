#!/usr/bin/env bash
RESPONSE=$(os:confirm "Are you sure?" "Continue?")
assert:truthy "os:confirm"

str:is:equal "$RESPONSE" "OK"
assert:truthy "os:confirm str:is:equal OK"

os:notify "yo" "we up"
assert:truthy "os:notify"

os:speak "yo" "we up"
assert:truthy "os:speak"