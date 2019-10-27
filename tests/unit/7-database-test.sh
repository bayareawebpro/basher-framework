#!/usr/bin/env bash
### TEST Database
if has:database; then
  drop:database git_test_output > /dev/null 2>&1
fi
if file:exists; then
  file:remove
fi

assert:falsy "make:myconf"

has:database  git_test_output
assert:falsy  "has:database"

make:database git_test_output true
assert:truthy "make:database"

has:database  git_test_output
assert:truthy "has:database"

drop:database git_test_output
assert:truthy "drop:database"

has:database  git_test_output
assert:falsy  "has:database"