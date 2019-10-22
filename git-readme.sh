#!/bin/bash

#logger:success
#logger:info
#logger:warning
#logger:error
#logger:debug
#logger:divider
#logger:blank
function git:readme() {
  logger:info "Creating README.md..."
  if [ -f "README.md" ]; then
    logger:warning "README.md already exists."
  else
    REPO=$(basename "$PWD")
    {
      echo "# $REPO"
      echo "[](https://github.com/bayareawebpro/$REPO/workflows/ci/badge.svg)"
      echo '[](https://img.shields.io/badge/License-MIT-success.svg)'
      echo '[](https://img.shields.io/badge/Version-1.0-blue.svg)'
    } >>README.md
    logger:success "README.md Created!"
  fi
}