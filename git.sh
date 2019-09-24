#!/bin/bash

function git:initRepo() {
  echo 'test'
}


# Initialize GIT Repository
function git:initRepo() {
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    exit 1
  else
    git init
  fi
}

# Add Remote
function git_addRemote() {
  REPO=$(basename "$PWD")
  git remote add origin "git@github.com:bayareawebpro/${REPO}"
}

# Add ReadMe
function git_addReadMe() {
  if [ -f "README.md" ]; then
    echo "README.md already exists."
  else
    touch README.md
    echo "# ${REPO}" >>README.md
  fi
}

# Add .gitignore
function git_addIgnored() {
  if [ -f ".gitignore" ]; then
    echo ".gitignore already exists."
  else
    touch .gitignore
    echo ".idea
*.lock
/vendor
/node_modules
/public/hot" >>.gitignore
  fi
}

# Add Commit
function git_commitAndPush() {
  git add .
  if [ -z "$1" ]; then
    MESSAGE="$1"
  else
    MESSAGE="WIP"
  fi
  # Initial Commit
  git commit -m "${MESSAGE}"
  git push
}

# Add GithubPages Branch
function git_docsBranch() {
  git checkout --orphan "gh-pages" && git rm -rf .
  git push --set-upstream origin gh-pages
  git add .
  git commit -m "Initial GhPages Commit"
  git push
}

# Add GithubPages Branch
function git_developBranch() {
  # Add Develop Branch
  git checkout -b "develop"
  git push --set-upstream origin develop
  git add .
  git commit -m "Initial Develop Commit"
  git push
}
