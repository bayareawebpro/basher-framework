#!/bin/bash
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

  #Remove Previous Test Run
  rm -r "$PROJECT_DIR"

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


install:animatecss() {
  if npm install animate.css; then
    {
      echo "@import '~animate.css/source/_base.css';"
      echo "@import '~animate.css/source/fading_entrances/fadeInUp.css';"
    } >>"$PWD/resource/css/animate.sass"

    echo "@import 'animate.sass';" >> "$PWD/resource/css/app.sass"
    logger:success "animate.css installed."
  else
    logger:error "Failed to install animate.css."
  fi
}
