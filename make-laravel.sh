#!/bin/bash
function make:laravel() {
  local PROJECT
  PROJECT="$1"
  make:project "$PROJECT"

  # Install dependancies...
  composer create-project laravel/laravel .
  composer require laravel-frontend-presets/tailwindcss --dev

  # Configure & Create Database
  make:database "$PROJECT"
  php artisan migrate

  # Install & Compile Assets
  #php artisan preset tailwindcss
  php artisan preset tailwindcss-auth
  npm install
  npm run dev

  # Serve the project.
}


install:animatecss() {
  if npm install animate.css; then
    {
      echo "@import '~animate.css/source/_base.css';"
      echo "@import '~animate.css/source/fading_entrances/fadeInUp.css';"
    } >>"$PWD/resource/css/animate.sass"
    echo "@import 'animate.sass';" >> "$PWD/resource/css/app.sass"
    logger:success "animate.css installed."
  else
    logger:error "Failed to install animate.css."
  fi
}
