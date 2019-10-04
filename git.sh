#!/bin/bash

# Hard Reset to HEAD
function git:reset() {
  git reset --hard HEAD
  echo "Repository Reverted!"
}

# Initialize GIT Repository
function git:init() {
  echo "Initializing local repository..."
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    exit 1
  else
    git init
    echo "Local Repository Created!"
  fi
  git:connect
  git:make:readMe
  git:make:ignore
  git:make:develop
  git:make:docs
}

# Add Remote Connection
function git:connect() {
  echo "Connecting to Remote Repository..."
  REPO=$(basename "$PWD")
  git remote add origin "git@github.com:bayareawebpro/${REPO}"
}

# Add Commit & Push to Remote
function git:save() {
  echo "Synchronizing with Remote Repository..."
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  echo "${MESSAGE}"
  git add . && git commit -m "${MESSAGE}" && git push
  echo "Remote Repository Synchronized!"
}

# Add ReadMe
function git:make:readMe() {
  echo "Making README.md..."
  if [ -f "README.md" ]; then
    echo "README.md already exists."
  else
    touch README.md
    echo "# ${REPO}" >>README.md
    echo "README.md Created!"
  fi
}

# Add .gitignore
function git:make:ignore() {
  echo "Making .gitignore..."
  if [ -f ".gitignore" ]; then
    echo ".gitignore already exists."
  else
    touch .gitignore
    echo ".idea
*.lock
/vendor
/node_modules
/public/hot" >>.gitignore
    echo ".gitignore Created!"
  fi
}

# Add GithubPages Branch
function git:make:docs() {
  echo "Creating Documentation Branch..."
  git checkout --orphan "gh-pages" && git rm -rf .
  git push --set-upstream origin gh-pages
  git:make:ignore
  git:make:readMe
  echo "Branch Created Successfully!"
  echo "Run git:save to syncronize."
  #git:save "Initial GhPages Commit"
}

# Add Develop Branch
function git:make:develop() {
  echo "Creating Development Branch..."
  git checkout -b "develop"
  git push --set-upstream origin develop
  git:make:ignore
  git:make:readMe
  echo "Branch Created Successfully!"
  echo "Run git:save to syncronize."
  #git:save "Initial Develop Commit"
}

# Make Project
function make:project() {
    PROJECT=$1
    if [ -z "$PROJECT" ]; then
        echo "Project name required"
        return;
    fi
    laravel new "$PROJECT"
    cd "$PROJECT" || exit 1;
    composer require laravel-frontend-presets/tailwindcss --dev
    php artisan preset tailwindcss-auth
    npm install
    npm run dev
}

