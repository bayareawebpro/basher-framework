#!/usr/bin/env bash
source git.sh

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear

git:setup
git:connect
git:ignore
git:readme
echo "Master v1.0" >> "$TEST_DIR/README.md"
git:save

git:branch gh-pages fresh
echo "Docs v1.0" >> "$TEST_DIR/README.md"
git:save

git:branch dev
echo "Dev v1.0" >> "$TEST_DIR/README.md"
git:save

git:switch master
git:branch:delete dev
git:branch:delete gh-pages
