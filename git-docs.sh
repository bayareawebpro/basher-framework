#!/bin/bash
function git:docs() {
  echo "===Making gh-pages branch==="
  echo "..."
  if (git checkout --orphan "gh-pages"); then
    git rm -rf .
    git push --set-upstream origin gh-pages
    git:ignore
    git:readme
    git add . && git commit -m "Initial Commit"
    echo "Branch Saved Successfully!"
    echo "Run git:sync to syncronize."
  else
    echo "Creating gh-pages branch failed!"
  fi
}