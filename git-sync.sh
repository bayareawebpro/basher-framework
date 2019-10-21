#!/bin/bash
function git:sync() {
  logger:info "Synchronizing Remote Repository"
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  if (git add . && git commit -m "${MESSAGE}"); then
    logger:info "Saving... ${MESSAGE}"
    git push && logger:success "Local Pushed to Remote Successfully!"
  else
    git pull && logger:error "Remote Pulled to Local Successfully!"
  fi
}
