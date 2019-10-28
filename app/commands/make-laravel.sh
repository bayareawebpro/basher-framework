#!/usr/bin/env bash
function on:laravel:install() {
  logger:debug "on:laravel:install"
  #install:tailwindcss
  #install:animatecss
}
function on:laravel:created() {
  logger:debug "on:laravel:created"
}

function make:laravel() {
  local PROJECT="$1"
  logger:divider && logger:celebrate "Building Laravel Project..."

  if make:project "$PROJECT"; then
    logger:divider && logger:info "Running Composer Install..."

    if composer create-project --prefer-dist laravel/laravel ./; then
      logger:success "Composer Install Completed"
    else
      logger:failed "Composer Install Failed"
      return 1
    fi

    # Callback Hook
    if func:exists "on:laravel:install"; then
      on:laravel:install "$PROJECT"
    fi

    # Configure & Create Database
    if logger:confirm "Create Database?"; then
      if make:database "$PROJECT" && php artisan migrate; then
        logger:success "Database: $PROJECT created."
      else
        logger:failed "Database: $PROJECT failed to be created / migrated."
      fi
   fi

    # Callback Hook
    if func:exists "on:laravel:created"; then
      on:laravel:created "$PROJECT"
    fi
  else
    logger:failed "Failed to Create $PROJECT"
  fi
}
