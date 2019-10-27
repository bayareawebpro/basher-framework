#!/usr/bin/env bash

function phpstorm:launch(){
  logger:info "Launching PhpStorm..."
  /Applications/PhpStorm.app/Contents/MacOS/phpstorm > /dev/null 2>&1
}
function phpstorm:open(){
  logger:info "Launching PhpStorm Project $(basename "$1")..."
  /Applications/PhpStorm.app/Contents/MacOS/phpstorm "$1" > /dev/null 2>&1
}