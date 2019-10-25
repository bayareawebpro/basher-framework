#!/usr/bin/env bash
function remote:ping() {
    ping -c 1 "$1"
}

function remote:require() {
  curl -s "$1" | bash /dev/stdin $*
}
