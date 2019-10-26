#!/bin/env bash
function switch:project() {
  logger:divider && logger:info "Switching Project..."
  if str:filled "$1"; then
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

  if str:empty "$BASHER_PROJECTS"; then
    logger:failed "BASHER_PROJECTS must be defined and directory must exist."
    return 1
  fi

  if str:filled "$1"; then
    local PROJECT="$1"
  else
    logger:input "Enter PROJECT folder name:" "PROJECT"
  fi

  if str:empty "$PROJECT"; then
    logger:failed "Project name required."
    return 1
  fi

  local DIR="$BASHER_PROJECTS/$PROJECT"
  logger:info "Verifying Project Directory: $DIR"

  if path:is:directory "$DIR"; then
    logger:warning "Project Directory already exists: $DIR"
    if ! logger:confirm "Delete $DIR?"; then
      return 1
    else
      directory:remove "$DIR"
      logger:success "Removed $DIR."
    fi
  fi

  if directory:make "$DIR" && directory:change "$DIR"; then
    logger:success "$PROJECT @ $DIR"
  else
    logger:failed "Failed Making: $PROJECT @ $DIR"
    return 1
  fi
}