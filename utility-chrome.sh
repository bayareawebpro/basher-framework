#!/usr/bin/env bash
function chrome:serve(){
  local DOMAIN
  if [ -n "$1" ]; then
    DOMAIN="https://$1"
    logger:success "Launching Chrome..."
  else
    logger:input "Domain Name or IP?" "ANSWER"
    DOMAIN="https://$ANSWER"
  fi
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "$DOMAIN"
  #php artisan serve
}
function chrome:secure(){
  local DOMAIN
  if [ -n "$1" ]; then
    DOMAIN="https://$1"
    logger:success "Launching Chrome..."
  else
    logger:input "Domain Name or IP?" "ANSWER"
    DOMAIN="https://$ANSWER"
  fi
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "$DOMAIN" --user-data-dir=/tmp/foo --ignore-certificate-errors --unsafely-treat-insecure-origin-as-secure="$DOMAIN:443"
  #php artisan serve
}
