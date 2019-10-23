#!/usr/bin/env bash

app:install(){
  if path:is:file "$HOME/.my.cnf"; then
  logger:success "BashApp Loaded 😎"
  else
    file:copy "$APP_PATH/.my.cnf" "$HOME/.my.cnf"
    logger:warning "Installed .my.cnf because it did not exist."
  fi
}