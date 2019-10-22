#!/usr/bin/env bash
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
    logger:warning ".gitignore already exists."
  else
    {
      echo "/.idea"
      echo "/*.lock"
      echo "/.phpunit.result.cache"
      echo "/node_modules"
      echo "/public/hot"
      echo "/vendor"
    } >>.gitignore
    logger:success ".gitignore Created!"
  fi
}