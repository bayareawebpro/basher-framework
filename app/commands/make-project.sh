#!/bin/env bash
function switch:project() {
  logger:divider && logger:info "Switching Project..."
  if string:not:empty "$1"; then
    local PROJECT="$1"
  else
    logger:input "Enter PROJECT folder name:" "PROJECT"
  fi

  local DIR="$BASHER_PROJECTS/$PROJECT"
  if path:is:directory "$DIR" && directory:change "$DIR"; then
    logger:success "Project $1 @ $DIR"
    phpstorm:open "$PWD"
  else
    logger:failed "Switching To Project $1 @ $DIR Failed."
    return 1
  fi
}

function make:project() {
  logger:divider && logger:info "Making Project..."

  if string:is:empty "$BASHER_PROJECTS"; then
    logger:failed "BASHER_PROJECTS must be defined and directory must exist."
    return 1
  fi

  if string:not:empty "$1"; then
    local PROJECT="$1"
  else
    logger:input "Enter PROJECT folder name:" "PROJECT"
  fi

  if string:is:empty "$PROJECT"; then
    logger:failed "Project name required."
    return 1
  fi

  local DIR="$BASHER_PROJECTS/$PROJECT"
  logger:info "Verifying Project Directory: $DIR"

  if path:is:directory "$DIR"; then
    logger:failed "Project Directory already exists: $DIR"
    return 1
  elif directory:make "$DIR" && directory:change "$DIR"; then
    logger:success "$PROJECT @ $DIR"
  else
    logger:failed "Failed Making: $PROJECT @ $DIR"
    return 1
  fi
}