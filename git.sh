#!/bin/bash
# Developed by Daniel Alvidrez
# dan@bayareawebpro.com
# https://devhints.io/bash

GIT_USER=bayareawebpro
source git-branch.sh
source git-connect.sh
source git-disconnect.sh
source git-docs.sh
source git-ignore.sh
source git-logger.sh
source git-origin.sh
source git-project.sh
source git-readme.sh
source git-report.sh
source git-reset.sh
source git-setup.sh
source git-sync.sh

function git:initial() {
  if git add . && git commit -m "Initial Commit"; then
    logger:success "Branch Initial Commit Created Successfully!"
  else
    logger:error "Failed to Create Branch Initial Commit."
    exit 1
  fi
}