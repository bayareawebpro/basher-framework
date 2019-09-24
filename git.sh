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
function git:addIgnore() {
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
function git:docsBranch() {
  git checkout --orphan "gh-pages" && git rm -rf .
  git push --set-upstream origin gh-pages
  git add .
  git commit -m "Initial GhPages Commit"
  git push
}

# Add Develop Branch
function git:developBranch() {
  # Add Develop Branch
  git checkout -b "develop" && git rm -rf .
  git push --set-upstream origin develop
  git:addIgnore
}
