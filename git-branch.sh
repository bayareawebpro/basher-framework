#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:branch() {
  BRANCH="$1"
  logger:info "Branching..."
  if git:branch:exists "$BRANCH"; then
    git checkout "$BRANCH"
    logger:success "Switched to Development $BRANCH"
  else
    if git:branch:fresh "$BRANCH"; then
      git:ignore
      git:readme
      echo "- $BRANCH v0.1" >>README.md
      if git:initial && git:upstream "$BRANCH"; then
        logger:success "Branch Saved Successfully!"
      else
        logger:error "Failed to Create docs Branch."
      fi
    fi
  fi
}
function git:branch:exists() {
  echo git show-ref "refs/heads/$1"
}
function git:branch:delete() {
  if git push origin --delete "$1"; then
    logger:success "Branch Deleted Successfully!"
  else
    logger:error "Failed to Delete $1 Branch."
  fi
}
function git:branch:publish(){
  if git push -u origin "bayareawebpro/$REPO" master; then
    logger:success "🛠 $REPO push to $ORIGIN completed."
    git:sync
  else
    logger:error "Connection to $ORIGIN failed!"
    logger:warning "Reository Required: https://github.com/new"
  fi
}
function git:branch:fresh() {
  echo git checkout -b "$1" && git rm -rf .
}