#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:branch() {
  logger:info "Branching to docs..."
  exists=$(git show-ref "refs/heads/gh-pages")
  REPO=$(basename "$PWD")
  if [ -n "$exists" ]; then
    git checkout gh-pages
    logger:success "Switched to Development Branch"
  else
    if (git checkout -b gh-pages && git rm -rf .); then
      git push --set-upstream "git@github.com:$GIT_USER/$REPO.git" gh-pages
      git:ignore
      git:readme
      echo "- gh-pages" >> README.md
      if (git add . && git commit -m "Initial Commit"); then
      git push --set-upstream origin gh-pages
        logger:success "Branch Saved Successfully!"
      else
        logger:error "Failed to Create docs Branch."
      fi
    fi
  fi
}