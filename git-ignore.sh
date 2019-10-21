#!/bin/bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:ignore() {
  logger:info "Creating .gitignore..."
  if [ -f .gitignore ]; then
    echo ".gitignore already exists."
  else
    {
      echo "/.idea"
      echo "/*.lock"
      echo "/.phpunit.result.cache"
      echo "/node_modules"
      echo "/public/hot"
      echo "/vendor"
    } >>.gitignore
    echo ".gitignore Created!"
  fi
}