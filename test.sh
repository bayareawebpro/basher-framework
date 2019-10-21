#!/usr/bin/env bash
source git.sh
clear

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
rm -rf "$TEST_DIR" || exit 1
mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1

# Logger
#logger:divider
#logger:success "WorkingPath: $TEST_DIR"
#logger:info "Testing ready to start."
#logger:warning "Testing failing..."
#logger:error "Testing failed!"
#logger:debug "Hmmm..."
#logger:divider
#logger:blank

git:setup
git:docs
#git:branch develop
#git:connect
#git push --force-with-lease
#git:connect
#git:save