#!/usr/bin/env bash
function php:quality() {
  logger:divider
  logger:confirm "Start PHP Linting & Test Suite?" || return 1
  if php:lint && php:test; then
    logger:celebrate "Everything Looks Good..."
  else
    logger:error "Analysis Incomplete."
  fi
}

function php:lint(){
  logger:divider
  logger:info "Linting Sourcecode..."
  if file:exists "vendor/bin/phpstan"; then
    if php artisan code:analyse; then
      logger:success "Sourcecode Looks Good..."
    else
      logger:failed "Unit Tests Failed!"
      return 1
    fi
  else
    logger:warning "PHPstan Not Installed."
    if logger:confirm "Install package: nunomaduro/larastan?"; then
      logger:info "Installing (nunomaduro/larastan)..."
      composer require --dev nunomaduro/larastan
      php:lint
    else
      return 1
    fi
  fi
}

function php:test(){
  logger:divider
  logger:info "Running Unit Tests..."
  if file:exists "vendor/bin/phpunit"; then
    if vendor/bin/phpunit; then
      logger:success "Unit Tests Passed..."
    else
      logger:failed "Unit Tests Failed!"
      return 1
    fi
  else
    logger:warning "PHPunit Not Installed."
    if logger:confirm "Install package: phpunit/phpunit?"; then
      logger:info "Installing (phpunit/phpunit)..."
      composer require --dev phpunit/phpunit
      php:test
    else
      return 1
    fi
  fi
}

function php:dusk(){
  logger:divider
  logger:info "Running Browser Tests..."
  if path:is:directory "vendor/laravel/dusk/bin"; then
    logger:info "Launching Dusk..."
    if php artisan dusk; then
      logger:success "Dusk Completed Successfully..."
    else
      logger:failed "Launching Dusk Failed!"
      return 1
    fi
  else
    logger:warning "Laravel Dusk Not Installed."
    if logger:confirm "Install package: laravel/dusk?"; then
      logger:info "Installing (laravel/dusk)..."
      composer require --dev laravel/dusk
      php artisan dusk:install
      php:dusk
    else
      return 1
    fi
  fi
}
