#!/bin/bash
function git:save()
{
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  logger:divider
  logger:info "Saving... ${MESSAGE}"
  if git add . && git commit -m "${MESSAGE}" && git push; then
    logger:success "Local Pushed to Remote Successfully!"
  else
    logger:error "Failed to push to remote!"
  fi
}
function git:sync()
{
  logger:divider
  logger:info "Synchronizing Remote Repository"
  if git pull; then
    logger:success "Remote Pulled to Local Successfully!"
  else
    logger:error "Remote Pull Failed!"
  fi
}
