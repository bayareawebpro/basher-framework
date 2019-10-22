#!/usr/bin/env bash
source ./git-module/git.sh

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear
echo "$pwd";

# Logger
#logger:divider
#logger:success "WorkingPath: $TEST_DIR"
#logger:info "Testing ready to start."
#logger:warning "Testing failing..."
#logger:error "Testing failed!"
#logger:debug "Hmmm..."
#logger:blank
git:setup
git:connect
git:sync

#if git:branch:exists gh-pages; then
#  git:branch:delete gh-pages
#fi
#if git:branch:exists develop; then
#  git:branch:delete develop
#fi
#
#logger:divider


#git:docs
#git:sync

#logger:divider


#git:branch:delete develop
#git:branch develop
#git:sync