#!/usr/bin/env bash

if str:empty "$BASHER_DB_USER"; then
  logger:warning "Skipping: BASHER_DB_USER not configured."
  continue
fi

### TEST Database
if has:database; then
  drop:database git_test_output > /dev/null 2>&1
fi

has:database  git_test_output
assert:falsy  "has:database"

make:database git_test_output true
assert:truthy "make:database"

database:export git_test_output "$BASHER_PATH/tests/mocks/filesystem/git_test_output-latest.sql"
assert:truthy "database:export"

database:import git_test_output "$BASHER_PATH/tests/mocks/filesystem/git_test_output-latest.sql"
assert:truthy "database:import"

has:database  git_test_output
assert:truthy "has:database"

drop:database git_test_output
assert:truthy "drop:database"

has:database  git_test_output
assert:falsy  "has:database"