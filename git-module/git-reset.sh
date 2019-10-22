#!/bin/bash
# Hard Reset to HEAD
function git:reset() {
  log:info "Re-Setting Local Repository"
  if [ -d ".git" ]; then
    git reset --hard HEAD
    echo "Repository Reverted!"
  else
    echo "Local repository not found!"
    exit 1
  fi
}