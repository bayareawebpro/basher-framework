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
    if vendor/bin/phpstan analyse; then
      logger:success "Sourcecode Looks Good..."
    else
      logger:failed "Unit Tests Failed!"
      return 1
    fi
  else
    logger:warning "PHPstan Not Installed."
    if logger:confirm "Run: composer install nunomaduro/larastan?"; then
      composer install nunomaduro/larastan
      return "$(php:lint)"
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
    if logger:confirm "Run: composer install phpunit/phpunit?"; then
      composer install phpunit/phpunit
      return "$(php:test)"
    else
      return 1
    fi
  fi
}

function php:dusk(){
  logger:divider
  logger:info "Running Browser Tests..."
  if file:exists "vendor/bin/dusk"; then
    if vendor/bin/dusk; then
      logger:success "Launching Dusk..."
    else
      logger:failed "Launching Dusk Failed!"
      return 1
    fi
  else
    logger:warning "Laravel Dusk Not Installed."
    if logger:confirm "Run: composer install laravel/dusk?"; then
      composer install laravel/dusk
      return "$(php:dusk)"
    else
      return 1
    fi
  fi
}
