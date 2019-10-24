#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:failed
#logger:debug
#logger:info

function git:branch:exists() {
  git show-ref "refs/heads/$1"
}

function git:switch() {
  logger:divider

  local BRANCH; BRANCH="$1"
  local EXISTS; EXISTS=$(git:branch:exists "$BRANCH")

  if [[ -z "$BRANCH" ]]; then
    logger:failed "Branch name not specified."
  elif [ -n "$EXISTS" ]; then
    logger:info "Switching Branch to $BRANCH..."
    git checkout "$BRANCH"
    logger:success "Switched to $BRANCH successfully."
  else
    logger:failed "Failed to Switch to branch $BRANCH."
    logger:debug "Create new: git:branch $BRANCH."
  fi
}

function git:branch:delete() {
  local BRANCH
  BRANCH="$1"
  logger:divider
  logger:info "Deleting Branch..."
  if git:branch:exists "$BRANCH" && git push origin --delete "$BRANCH"; then
    logger:success "Branch Deleted Successfully!"
  else
    logger:failed "Failed to Delete Branch."
  fi
}

function git:branch() {
  local BRANCH
  local FRESH
  BRANCH="$1"
  FRESH="$2"

  logger:divider
  logger:info "Branching..."

  if [[ -z "$BRANCH" ]]; then
    logger:failed "Branch name not specified." && exit 1
  fi

  logger:info "Creating Branch $BRANCH..."
  if git checkout -b "$BRANCH"; then
    logger:success "Branch $BRANCH created successfully."
  else
    logger:success "Branch $BRANCH exists, checking out $BRANCH."
    git checkout "$BRANCH" || (logger:failed "Branch name not specified." && exit 1)
  fi

  if [[ "$FRESH" == "fresh" ]]; then
    logger:divider
    logger:warning "Creating clean branch exit now or regret it, waiting 10 seconds..."
    git status
    sleep 10 && git rm -rf .
    logger:success "Branch $BRANCH cleared."
  fi

  # Something to Commit
  git:ignore
  git:readme

  logger:info "Setting Remote Upstream to origin $BRANCH..."
  if git push --set-upstream origin "$BRANCH"; then
    logger:success "Git Remote Upstream is set to origin $BRANCH and syncronized."
  else
    logger:failed "Git Remote Upstream Failed." && exit 1
  fi
}
