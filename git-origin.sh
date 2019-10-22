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
  REPO=$(basename "$PWD")
  ORIGIN="git@github.com:$GIT_USER/$REPO.git"
  echo "$ORIGIN"
}

function git:has:origin()
{
  [[ "$(git remote)" == "*origin*" ]]
}

function git:set:origin()
{
  logger:divider
  if git:has:origin; then
    logger:success "📡 Git Remote is origin."
  else
    logger:info "📡 Git Remote Connecting to $ORIGIN..."
    ORIGIN=$(git:origin)
    if git remote add origin "$ORIGIN" && git pull origin master; then
      logger:success "Git Remote is set to origin and syncronized: $ORIGIN."
      git push --set-upstream origin master
    else
      logger:warning "Git Remote failed to be set to origin: $ORIGIN."
    fi
  fi
}