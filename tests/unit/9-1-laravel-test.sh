#!/usr/bin/env bash
if str:filled "$BASHER_CI"; then
  logger:warning "Skipping, no User Confirmation available..."
  continue
fi

TEST_DIR="$HOME/Sites/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear
make:laravel "git-test-output"