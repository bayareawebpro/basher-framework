#!/bin/bash
function switch:project() {
  local PROJECT
  local PROJECT_DIR
  PROJECT="$1"
  if [ -z "$PROJECT" ]; then
    logger:error "Project name required."
    exit 1
  fi
  cd "$GIT_PROJECTS_PATH/$PROJECT" || (logger:error "Failed Switching To: $PROJECT" && exit 1)
}
function make:project() {
  local PROJECT
  local PROJECT_DIR
  logger:divider
  logger:info "Making Project..."

  PROJECT="$1"
  if [ -z "$PROJECT" ]; then
    logger:error "Project name required."
    exit 1
  fi

  if [ -z "$GIT_PROJECTS_PATH" ]; then
    logger:error "GIT_PROJECTS_PATH directory must exist."
    exit 1
  fi

  PROJECT_DIR="$GIT_PROJECTS_PATH/$PROJECT"

  logger:info "Verifying Project Directory: $PROJECT_DIR"
  if [ -d "$PROJECT_DIR" ]; then
    logger:error "Project Directory already exists: $PROJECT_DIR"
    exit 1
  else
    mkdir "$PROJECT_DIR" || (logger:error "Failed Making: $PROJECT_DIR" && exit 1)
    cd "$PROJECT_DIR" || (logger:error "Failed Switching: $PROJECT_DIR" && exit 1)
    logger:success "$PROJECT @ $PROJECT_DIR"
  fi
}