#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info

function git:switch() {
  local BRANCH
  BRANCH="$1"
  local EXISTS

  logger:divider
  EXISTS=$(git:branch:exists "$BRANCH")
  if [[ -z "$BRANCH" ]]; then
    logger:error "Branch name not specified."
  elif [ -n "$EXISTS" ]; then
    logger:info "Switching Branch to $BRANCH..."
    git checkout "$BRANCH"
    logger:success "Switched to $BRANCH successfully."
  else
    logger:error "Failed to Switch to branch $BRANCH."
    logger:debug "Create new: git:branch $BRANCH."
  fi
}

function git:branch:exists() {
  git show-ref "refs/heads/$1"
}

function git:branch:delete() {
  local BRANCH
  BRANCH="$1"
  logger:divider
  logger:info "Deleting Branch..."
  if git:branch:exists "$BRANCH" && git push origin --delete "$BRANCH"; then
    logger:success "Branch Deleted Successfully!"
  else
    logger:error "Failed to Delete Branch."
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
    logger:error "Branch name not specified." && exit 1
  elif [[ -n "$BRANCH" ]]; then
    logger:info "Creating Branch $BRANCH..."
    if git checkout -b "$BRANCH"; then
      logger:success "Branch $BRANCH created successfully."
    else
      logger:success "Branch $BRANCH exists, checking out $BRANCH."
      git checkout "$BRANCH"
    fi
    if [[ "$FRESH" == "fresh" ]]; then
      git status
      logger:warning "Creating clean branch exit now or regret it, waiting 10 seconds..."
      sleep 10
      git rm -rf .
      logger:success "Branch $BRANCH cleared."
    fi
    git:ignore
    git:readme
    logger:info "Setting Remote Upstream to origin $BRANCH..."
    git push --set-upstream origin "$BRANCH"
    logger:success "Git Remote Upstream is set to origin $BRANCH and syncronized."
  fi
}
