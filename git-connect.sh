#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:upstream() {
  if git branch --set-upstream-to="$1" "$2"; then
    logger:success "Origin Linked Successfully!"
  else
    logger:error "Failed to Link Origin."
  fi
}
function git:connected() {
  ORIGIN="$(git:origin)"
  if [ "$(git remote)" != "*$ORIGIN*" ]; then
    return 1
  else
    return 0
  fi
}
function git:connect() {
  ORIGIN="$(git origin)"
  logger:info "📡 Connecting to $ORIGIN..."
  if git:connected; then
    logger:warning "Origin exists, skipping..."
  else
    logger:success "Added upstrean $ORIGIN to $REPO."
    git branch --set-upstream-to="git-test-output/master" master
    git fetch
  fi
  if git:connected; then
    logger:success "GIT Connected"
  fi
}