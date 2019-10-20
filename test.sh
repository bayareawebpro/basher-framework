#!/usr/bin/env bash

# Clear the console
clear

# Source git functions
source git.sh

# Cleanup previous run
TEST_DIR="$HOME/Desktop/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1

echo "Test Setup: $TEST_DIR"

git:init
#git:make:readme
#git:make:ignore
#git:make:develop
#git:make:docs
#git:connect
#git:save