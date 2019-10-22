#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info

function git:initial()
{
  logger:divider
  if git add . && git commit -m "Initial Commit"; then
    logger:success "Branch Initial Commit Created Successfully!"
  else
    logger:error "Failed to Create Branch Initial Commit." && exit 1
  fi
}