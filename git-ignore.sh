#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info
function git:ignore()
{
  logger:divider
  logger:info "Creating .gitignore..."
  if [ -f .gitignore ]; then
    logger:warning ".gitignore already exists."
  else
    {
      echo "/.idea"
      echo "/.phpunit.result.cache"
      echo "/*.lock"
    } >>.gitignore
    logger:success ".gitignore Created!"
  fi
}