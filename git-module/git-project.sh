#!/bin/bash
# Make Project
function git:laravel() {
  echo "===Making Project==="
  PROJECT=$1
  if [ -z "$PROJECT" ]; then
    echo "Project name required" && exit 1
  else
    PROJECT="$HOME/Sites/$PROJECT"
  fi
  echo "$PROJECT"
  exit 1

  if [ -d "$PROJECT" ]; then
    echo "Project path already exists!" && exit 1
  else
    mkdir "$PROJECT" || exit 1
    cd "$PROJECT" || exit 1
  fi

  echo "Building $PROJECT..."
  echo "..."

  composer create-project laravel/laravel .
  composer require laravel-frontend-presets/tailwindcss --dev

  php artisan preset tailwindcss
  php artisan preset tailwindcss-auth
  npm install
  npm run dev
}