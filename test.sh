#!/usr/bin/env bash
source git.sh

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
#rm -rf "$TEST_DIR" || exit 1
#mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear

#git:setup
git:connect
echo "WIP" >> "$TEST_DIR/README.md"
git:save

git:branch dev
echo "WIP" >> "$TEST_DIR/README.md"
git:save

git:branch gh-pages fresh
echo "WIP" >> "$TEST_DIR/README.md"
git:save