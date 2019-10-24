#!/bin/bash
function install:tailwindcss(){
    logger:divider && logger:info "Installing tailwindcss"

    if path:is:file bootstrap/app.php; then
      logger:info "Detected Laravel, using Composer Package..."
      composer require laravel-frontend-presets/tailwindcss --dev
      php artisan preset tailwindcss-auth

      logger:success "tailwindcss installed, running NPM..."
      npm install && npm run dev

    elif file:exists package.json; then
      logger:info "Using NPM, Laravel not detected..."
      npm install tailwindcss && npx tailwind init
      logger:success "tailwindcss installed via NPM"
    else
      logger:failed "Failed to install tailwindcss package.json not detected"
    fi
}