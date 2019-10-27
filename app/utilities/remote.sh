#!/usr/bin/env bash
function remote:ping() {
    logger:divider
    logger:info "Pinging: $1"
    ping -c 1 "$1"
}

function remote:require() {
  logger:divider
  logger:info "Loading Remote Script: $1"
  curl -s "$1" | bash /dev/stdin $*
}
