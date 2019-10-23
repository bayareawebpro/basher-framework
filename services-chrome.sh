#!/usr/bin/env bash
function chrome:serve(){
  local DOMAIN
  if [ -n "$1" ]; then
    DOMAIN="https://$1"
  else
    DOMAIN="https://127.0.0.1:8000"
  fi
  logger:success "Launching Chrome..."
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "$DOMAIN" --user-data-dir=/tmp/foo
  #php artisan serve
}

function chrome:secure(){
  local DOMAIN
  if [ -n "$1" ]; then
    DOMAIN="https://$1"
  else
    DOMAIN="https://127.0.0.1:8000"
  fi
  logger:success "Launching Chrome Fake Secure..."
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "$DOMAIN" --user-data-dir=/tmp/foo --ignore-certificate-errors --unsafely-treat-insecure-origin-as-secure="$DOMAIN:443"
  #php artisan serve
}
