#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:connect() {
  ORIGIN="$(git:origin)"
  logger:info "📡 Connecting to $ORIGIN..."

  if [[ $(git remote) != "*$ORIGIN*" ]]; then
    git remote add origin "$ORIGIN"
    git:sync
    logger:success "Added $REPO as $ORIGIN successfully."
  else
    logger:info "Origin exists, skipping..."
  fi
  #if (git push -u origin master); then
  #  logger:success "🛠 $REPO push to $ORIGIN completed."
  #  git:sync
  #else
  #  logger:error "Connection to $ORIGIN failed!"
  #  logger:warning "Reository Required: https://github.com/new"
  #fi
}