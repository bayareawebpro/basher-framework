#!/bin/bash
# Hard Reset to HEAD
function git:reset() {
  logger:divider
  logger:info "Reverting Repository State"
  if git reset --hard HEAD; then
    logger:success "Repository Reverted!"
  else
    logger:failed "Reverting Repository Failed!"
    exit 1
  fi
}