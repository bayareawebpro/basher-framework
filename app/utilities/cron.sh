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

# Install Cron Command
function cron:install(){
  logger:divider
  logger:info "Cron Installing: $1"
  if cron:has "$1"; then
    logger:success "$1 already installed."
    return 1
  fi
  if (crontab -l; echo "$1") | sort - | uniq - | crontab -; then
    logger:success "$1 is installed."
  else
    logger:failed "$1 failed to be installed."
    return 1
  fi
}

# UnInstall Cron Command
function cron:uninstall(){
  logger:divider
  logger:info "Cron UnInstalling: $1"
  if (crontab -l; "$1") 2>&1 | grep -v "no crontab" | grep -v "$1" | sort | uniq | crontab -; then
    logger:success "$1 is uninstalled."
  else
    logger:failed "$1 failed to be uninstalled."
  fi
}
