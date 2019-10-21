#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:develop() {
  logger:info "Making develop branch..."
  if (git checkout develop); then
    logger:success "Switched to Development Branch"
  else
    if (git checkout -b develop); then
      git push --set-upstream origin develop
      git:ignore
      git:readme
      if (git add . && git commit -m "Initial Commit"); then
        logger:success "Branch Saved Successfully!"
        logger:blank
        logger:info "Run git:sync to syncronize."
        logger:text "https://github.com/new"
      else
        logger:error "Failed to create development branch."
      fi
    fi
  fi
}
