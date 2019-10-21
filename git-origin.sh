#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:origin() {
  REPO=$(basename "$PWD")
  ORIGIN="git@github.com:$GIT_USER/$REPO.git"
  return "$ORIGIN"
}