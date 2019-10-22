#!/usr/bin/env bash
source git.sh

# Setup
TEST_DIR="$HOME/Desktop/git-test-output"
#rm -rf "$TEST_DIR" || exit 1
#mkdir "$TEST_DIR" || exit 1
cd "$TEST_DIR" || exit 1
clear

#git:setup
#git:set:origin
#git:ignore
#git:readme
#echo "WIP" >> "$TEST_DIR/README.md"
#git:save
#git:branch gh-pages fresh && git:save
#git:branch dev && git:save
#git:switch master

#logger:divider
#logger:success "WorkingPath: $TEST_DIR"
#logger:info "Testing ready to start."
#logger:warning "Testing failing..."
#logger:error "Testing failed!"
#logger:debug "Hmmm..."
#logger:blank

#git:switch dev
#git:branch:delete dev

#git:switch gh-pages
#git:branch:delete gh-pages

#git:switch gh-pages
#git:reset