#!/usr/bin/env bash
function chrome:serve(){
  logger:divider && logger:info "Launching $DOMAIN with Chrome..."
  local DOMAIN="$1"
  if string:is:empty "$DOMAIN"; then
    DOMAIN="127.0.0.1"
  fi
  if string:not:empty "$BASHER_CHROME_SECURE"; then
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "https://$DOMAIN" --user-data-dir=/tmp/basher --ignore-certificate-errors --unsafely-treat-insecure-origin-as-secure="https://$DOMAIN:443"
  else
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "http://$DOMAIN" --user-data-dir=/tmp/basher
  fi
}
