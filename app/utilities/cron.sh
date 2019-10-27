#!/usr/bin/env bash
function cron:list(){
  crontab -l
}
function cron:edit(){
  crontab -e
}
function cron:has(){
  [[ $(crontab -l) =~ .*$1.* ]]
}
function cron:install(){
  if cron:has "$1"; then
    logger:success "$1 already installed."
    return 1
  fi
  if ! file:is:executable "$1"; then
    logger:info "Making file executable."
    file:make:executable "$1"
  fi
  if (crontab -l; echo "* * * * * /usr/bin/env bash $1 > $1.log") | sort - | uniq - | crontab -; then
    logger:success "$1 is installed."
  else
    logger:failed "$1 failed to be installed."
    return 1
  fi
}
function cron:uninstall(){
  if ! cron:has "$1"; then
    logger:success "$1 already uninstalled."
    return 1
  fi
  if (crontab -l; "* * * * * /usr/bin/env bash $1 > $1.log") 2>&1 | grep -v "no crontab" | grep -v "$1" | sort | uniq | crontab -; then
    logger:success "$1 is uninstalled."
  else
    logger:failed "$1 failed to be uninstalled."
  fi
}
