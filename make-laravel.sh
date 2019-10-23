#!/bin/bash
function make:laravel() {
  local PROJECT
  PROJECT="$1"
  if make:project "$PROJECT"; then
    # Install dependancies...
    logger:divider
    logger:info "Running Composer Install"
    composer create-project --prefer-dist laravel/laravel ./
    composer require laravel-frontend-presets/tailwindcss --dev
    php artisan preset tailwindcss-auth

    # Configure & Create Database
    if make:database "$PROJECT" && php artisan migrate; then
      logger:success "Database created & configured."
    else
      logger:warning "Database may already exist and was not migrated."
    fi

    # Install & Compile Assets
    logger:divider
    logger:info "Running NPM Install"
    npm install
    npm run dev
    phpstorm:open "$PWD"
    chrome:serve "http://127.0.0.1:8000"
  else
    logger:error "Failed to Create $PROJECT"
  fi
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
