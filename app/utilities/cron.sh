#!/usr/bin/env bash
function cron:list(){
  crontab -l
}
function cron:edit(){
  crontab -e
}
function cron:has(){
  [[ $(crontab -l) =~ .*"$1".* ]]
}

function cron:install:laravel() {
    logger:divider
    logger:info "Installing Laravel Cron Task..."
    local PROJECT="$1"
    if str:empty "$PROJECT"; then
      logger:input "Enter PROJECT name." "PROJECT"
    fi
    local PROJECT_PATH="$BASHER_PROJECTS/$PROJECT"
    if ! path:is:file "$PROJECT_PATH/artisan"; then
      logger:failed "$PROJECT_PATH/artisan does not exist."
      return 1
    fi
    local COMMAND="* * * * * cd $PROJECT_PATH && php artisan schedule:run >> /dev/null 2>&1"
    logger:info "Installing Command: $COMMAND"
    if cron:has "$COMMAND"; then
      logger:success "Cron Command  Already Installed."
    elif cron:install "$COMMAND"; then
      logger:success "Cron Command Installed Successfully."
    fi
    cron:list
}

function cron:uninstall:laravel() {
    logger:divider
    logger:info "UnInstalling Laravel Cron Task..."
    local PROJECT="$1"
    if str:empty "$PROJECT"; then
      logger:input "Enter PROJECT name." "PROJECT"
    fi
    local PROJECT_PATH="$BASHER_PROJECTS/$PROJECT"
    if ! path:is:file "$PROJECT_PATH/artisan"; then
      logger:failed "$PROJECT_PATH/artisan does not exist."
      return 1
    fi
    local COMMAND="* * * * * cd $PROJECT_PATH && php artisan schedule:run >> /dev/null 2>&1"
    logger:info "UnInstalling Command: $COMMAND"
    if ! cron:has "$COMMAND"; then
      logger:success "Cron Command Already UnInstalled."
    elif cron:uninstall "$COMMAND"; then
      logger:success "Cron Command UnInstalled Successfully."
    else
      logger:failed "Cron Command Failed to be UnInstalled."
      cron:list
    fi
}

# Install Cron Command
function cron:install(){
  logger:warning "Cron Installing..."
  if cron:has "$1"; then
    logger:success "Cron Already Installed: $1"
    return 1
  fi
  if (crontab -l; echo "$1") | sort - | uniq - | crontab -; then
    logger:success "Cron Installed: $1"
  else
    logger:failed "Cron Install Failed: $1"
    return 1
  fi
}

# UnInstall Cron Command
function cron:uninstall(){
  logger:warning "Cron UnInstalling..."
  if (crontab -l; "$1") 2>&1 | grep -v "no crontab" | grep -v "$1" | sort | uniq | crontab -; then
    logger:success "Cron UnInstalled: $1"
  else
    logger:failed "Cron UnInstall Failed: $1"
  fi
}
