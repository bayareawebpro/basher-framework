#!/usr/bin/env bash
if str:empty "$BASHER_GIT_USER"; then
  logger:warning "Skipping: BASHER_GIT_USER not configured."
  continue
fi


TEST_DIR="$HOME/Sites/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear

git:setup
assert:truthy "git:setup"

git:connect
assert:truthy "git:connect"

echo "Master v1.0" >> "$TEST_DIR/README.md"
git:save
assert:truthy "git:save"

## TEST Branching
git:branch gh-pages fresh
assert:truthy "git:branch gh-pages fresh"

echo "Docs v1.0" >> "$TEST_DIR/README.md"
git:save
assert:truthy "git:save"

git:branch dev
assert:truthy "git:branch dev"
echo "Dev v1.0" >> "$TEST_DIR/README.md"

git:save
assert:truthy "git:save"

git:switch master
assert:truthy "git:switch master"

git:branch:delete dev
assert:truthy "git:branch:delete dev"

git:branch:delete gh-pages
assert:truthy "git:branch:delete gh-pages"