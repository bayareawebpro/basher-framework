#!/usr/bin/env bash

# ========= Setup New Repo =========
function git:setup() {
  logger:divider
  logger:info "Initializing Local Repository..."
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    return 1
  else
    git init
  fi
}

# ========= Hard Reset to HEAD =========
function git:reset() {
  logger:divider
  logger:info "Reverting Repository State"
  if git reset --hard HEAD; then
    logger:success "Repository Reverted!"
  else
    logger:failed "Reverting Repository Failed!"
    return 1
  fi
}

# ========= GIT Report =========
function git:report() {
  logger:divider
  logger:info "Generating Commit Report..."
  echo "CommitHash,Author,Date,Comment" >git-commit-log.csv
  git log --after='last month' --date=short --pretty=format:'%h,%an,%ad,%s' >>git-commit-log.csv
  logger:success "Commit Report Generated"
}

# ========= GIT Origin =========
function git:origin() {
  local REPO=$(basename "$PWD")
  echo "git@github.com:$BASHER_GIT_USER/$REPO.git"
}
# ========= GIT URL =========
function git:url() {
  local REPO=$(basename "$PWD")
  echo "https://github.com/$BASHER_GIT_USER/$REPO"
}

# ========= GIT Has Origin =========
function git:has:origin() {
  [[ "$(git remote)" == "*origin*" ]]
}

# ========= GIT Status =========
function git:status() {
  git status
}

# ========= GIT Connect =========
function git:connect() {
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

# ========= Git Initial =========
function git:initial() {
  logger:divider
  if git add . && git commit -m "Initial Commit"; then
    logger:success "Initial Commit Created Successfully!"
  else
    logger:failed "Failed to Create Initial Commit."
  fi
}

# ========= GIT Ignore =========
function git:ignore() {
  logger:divider
  logger:info "Creating .gitignore..."
  if [ -f .gitignore ]; then
    logger:warning ".gitignore already exists."
  else
    {
      echo "/.idea"
      echo "/.phpunit.result.cache"
      echo "/*.lock"
    } >>.gitignore
    logger:success ".gitignore Created!"
  fi
}

# ========= GIT ReadMe =========
function git:readme() {
  logger:info "Creating README.md..."
  if [ -f "README.md" ]; then
    logger:warning "README.md already exists."
  else
    REPO=$(basename "$PWD")
    {
      echo "# $REPO"
      echo "![](https://github.com/bayareawebpro/$REPO/workflows/ci/badge.svg)"
      echo '![](https://img.shields.io/badge/License-MIT-success.svg)'
      echo '![](https://img.shields.io/badge/Version-1.0-blue.svg)'
    } >>README.md
    logger:success "Created README.md!"
  fi
}

# ========= GIT Save (push) =========
function git:save() {
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  logger:divider
  logger:info "Saving... ${MESSAGE}"
  if git add . && git commit -m "${MESSAGE}" && git push; then
    logger:success "Local Pushed to Remote Successfully!"
    git:url
  else
    logger:failed "Failed to push to remote!"
    return 0
  fi
}

# ========= GIT Sync (pull) =========
function git:sync() {
  logger:divider
  logger:info "Synchronizing Remote Repository"
  if git pull; then
    logger:success "Syncronized Successfully!"
  else
    logger:failed "Syncronize Failed!"
  fi
}

# ========= GIT Branch Exists =========
function git:branch:exists() {
  git show-ref "refs/heads/$1"
}

# ========= Switch to GIT Branch =========
function git:switch() {
  logger:divider

  local BRANCH
  BRANCH="$1"
  local EXISTS
  EXISTS=$(git:branch:exists "$BRANCH")

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

# ========= Delete GIT Branch =========
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

# ========= Create GIT Branch =========
function git:branch() {
  local BRANCH
  local FRESH
  BRANCH="$1"
  FRESH="$2"

  logger:divider
  logger:info "Branching..."

  if [[ -z "$BRANCH" ]]; then
    logger:failed "Branch name not specified." && return 1
  fi

  logger:info "Creating Branch $BRANCH..."
  if git checkout -b "$BRANCH"; then
    logger:success "Branch $BRANCH created successfully."
  else
    logger:success "Branch $BRANCH exists, checking out $BRANCH."
    git checkout "$BRANCH" || logger:failed "Branch name not specified." && return 1
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
