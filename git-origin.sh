#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:origin()
{
  local REPO
  local ORIGIN
  REPO=$(basename "$PWD")
  ORIGIN="git@github.com:$GIT_USER/$REPO.git"
  echo "$ORIGIN"
}

function git:has:origin()
{
  [[ "$(git remote)" == "*origin*" ]]
}

function git:connect()
{
  logger:divider
  if git:has:origin; then
    logger:success "📡 Git Remote is origin."
  else
    local ORIGIN
    ORIGIN=$(git:origin)
    logger:info "Git Remote 📡 Connecting to $ORIGIN..."
    if git remote add origin "$ORIGIN" && git pull origin master; then
      logger:success "Git Remote is set to origin and syncronized: $ORIGIN."
      logger:info "Setting Remote Upstream to origin master..."
      git push --set-upstream origin master
      logger:success "Git Remote Upstream is set to origin master and syncronized: $ORIGIN."
    else
      logger:warning "Git Remote failed to be set to origin: $ORIGIN."
    fi
  fi
}