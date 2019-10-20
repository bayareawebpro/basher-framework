#!/bin/bash

# Hard Reset to HEAD
function git:reset() {
  if [ -d ".git" ]; then
    git reset --hard HEAD
    echo "Repository Reverted!"
  else
    echo "Local repository not found!"
    exit 1
  fi
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
}

# Add Remote Connection
function git:connect() {
  REPO=$(basename "$PWD")
  ORIGIN="git@github.com:bayareawebpro/${REPO}"
  echo "Connecting to $ORIGIN..."
  git remote add origin "git@github.com:bayareawebpro/${REPO}.git"
  git push --set-upstream origin master
}

# Rmove All Connections
function git:disconnect() {
  git remote rm origin
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

# Add Commit & Push to Remote
function git:sync() {
  echo "Synchronizing with Remote Repository..."
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  echo "Saving... ${MESSAGE}"

  if (git add . && git commit -m "${MESSAGE}"); then
    git push && echo "Remote Repository Synchronized!"
  else
    echo "Command failed"
  fi
}

# Add ReadMe
function git:make:readme() {
  echo "Making README.md..."
  if [ -f "README.md" ]; then
    echo "README.md already exists."
  else
    REPO=$(basename "$PWD")
    {
      echo "# $REPO" >>"README.md"
      echo "[](https://github.com/bayareawebpro/{$REPO}/workflows/tests/badge.svg)"
      echo '[](https://img.shields.io/badge/License-MIT-success.svg)'
      echo '[](https://img.shields.io/badge/Version-1.0-blue.svg)'
    } >>README.md
    echo "README.md Created!"
  fi
}

# Add .gitignore
function git:make:ignore() {
  echo "Making .gitignore..."
  if [ -f .gitignore ]; then
    echo ".gitignore already exists."
  else
    {
      echo ".idea"
      echo "*.lock"
      echo "/vendor"
      echo "/node_modules"
      echo "/public/hot"
      echo ".gitignore Created!"
    } >>.gitignore
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
    return
  fi
  laravel new "$PROJECT"
  cd "$PROJECT" || exit 1

  composer require laravel-frontend-presets/tailwindcss --dev
  php artisan preset tailwindcss
  php artisan preset tailwindcss-auth
  npm install
  npm run dev
}
