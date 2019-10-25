#!/usr/bin/env bash
function php:lint(){
  if file:exists "vendor/bin/phpstan"; then
    logger:divider && logger:info "Linting Sourcecode..."
    if vendor/bin/phpstan analyse; then
      logger:success "Sourcecode Looks Good..."
    else
      logger:failed "Unit Tests Failed!"
      return 1
    fi
  else
    logger:warning "PHPstan Not Installed."
    logger:info "Run: composer install nunomaduro/larastan."
    return 2
  fi
}
function php:test(){
  if file:exists "vendor/bin/phpunit"; then
    logger:divider && logger:info "Running Unit Tests..."
    if vendor/bin/phpunit; then
      logger:success "Running Unit Tests..."
    else
      logger:failed "Unit Tests Failed!"
      return 1
    fi
  else
    logger:warning "PHPunit Not Installed."
    logger:info " Run: composer install phpunit/phpunit."
    return 2
  fi
}
function php:quality() {
  logger:divider
  logger:confirm "Start PHP Linting & Test Suite?" || return 1
  if php:lint && php:test; then
    logger:celebrate "Everything Looks Good..."
  else
    logger:error "Analysis Incomplete"
  fi
}
