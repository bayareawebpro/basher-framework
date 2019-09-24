#!/bin/bash

# Hard Reset to HEAD
function git:reset() {
  git reset --hard HEAD
  echo "Repository Reverted."
}

# Initialize GIT Repository
function git:init() {
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    exit 1
  else
    git init
  fi
  get:connect
  git:make:readMe
  git:make:ignore
  git:make:docs
  git:make:develop
}

# Add Remote Connection
function get:connect() {
  REPO=$(basename "$PWD")
  git remote add origin "git@github.com:bayareawebpro/${REPO}"
}

# Add ReadMe
function git:make:readMe() {
  if [ -f "README.md" ]; then
    echo "README.md already exists."
  else
    touch README.md
    echo "# ${REPO}" >>README.md
  fi
}

# Add .gitignore
function git:make:ignore() {
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

# Add Commit & Push to Remote
function git:commitAndPush() {
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  echo "${MESSAGE}";
  git add . && git commit -m "${MESSAGE}" && git push
}

# Add GithubPages Branch
function git:make:docs() {
  git checkout --orphan "gh-pages" && git rm -rf .
  git push --set-upstream origin gh-pages
  git:make:ignore
  git:make:readMe
  #git:commitAndPush "Initial GhPages Commit"
}

# Add Develop Branch
function git:make:develop() {
  git checkout -b "develop"
  git push --set-upstream origin develop
  #git:commitAndPush "Initial Develop Commit"
}
