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
make:laravel "git-test-output"