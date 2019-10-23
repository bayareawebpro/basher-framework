#!/usr/bin/env bash
source /Users/builder/bash-profile/app.sh

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear

#git:setup
#git:connect

#if logger:confirm "Testing App... Are you sure?"; then
#  logger:success "Completed."
#else
#  logger:error "Aborted."
#fi

#logger:input "Project Name?" "ANSWER"
#logger:success "$ANSWER.";


exit;
make:laravel "git-test-output"
install:animatecss
git:ignore
git:readme
echo "Master v1.0" >> "$TEST_DIR/README.md"
git:setup
git:connect
git:save
chrome:serve



#git:branch gh-pages fresh
#echo "Docs v1.0" >> "$TEST_DIR/README.md"
#git:save

#git:branch dev
#echo "Dev v1.0" >> "$TEST_DIR/README.md"
#git:save

#git:switch master
#git:branch:delete dev
#git:branch:delete gh-pages

# Converted to underscores instead of hypens
#make:database git-test-output
