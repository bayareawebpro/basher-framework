#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:failed
#logger:debug
#logger:info

function git:initial()
{
  logger:divider
  if git add . && git commit -m "Initial Commit"; then
    logger:success "Initial Commit Created Successfully!"
  else
    logger:failed "Failed to Create Initial Commit."
  fi
}