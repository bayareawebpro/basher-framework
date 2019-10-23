#!/bin/bash
function switch:project() {
   if string:is:empty "$1"; then
    logger:error "Project Name Required." && return 1
  fi
  if path:is:directory "$GIT_PROJECTS_PATH/$1"; then
    cd "$GIT_PROJECTS_PATH/$1" || logger:success "$1 @ $GIT_PROJECTS_PATH/$1"
  else
    logger:error "Switching To Project $1 Failed." && return 1
  fi
}

function make:project() {
  logger:info "Making Project..."
  logger:divider

  local PROJECT; PROJECT="$1"
  if string:is:empty "$PROJECT"; then
    logger:error "Project name required."
    return 1
  fi
  if string:is:empty "$GIT_PROJECTS_PATH"; then
    logger:error "GIT_PROJECTS_PATH directory must exist."
    return 1
  fi

  local DIR; DIR="$GIT_PROJECTS_PATH/$PROJECT"
  logger:info "Verifying Project Directory: $DIR"
  rm -rf "$DIR"
  if path:is:directory "$DIR"; then
    logger:error "Project Directory already exists: $DIR"
    return 1
  fi
  if directory:make "$DIR" && directory:change "$DIR"; then
    logger:success "$PROJECT @ $DIR"
  else
    logger:error "Failed Making: $PROJECT @ $DIR"
    return 1
  fi
}