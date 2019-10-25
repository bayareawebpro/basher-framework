#!/usr/bin/env bash

app:install() {
  if path:is:file "$HOME/.my.cnf"; then
    logger:warning ".my.cnf is already configured."
  else
    file:copy "$APP_PATH/.my.cnf" "$HOME/.my.cnf"
    logger:warning "Installed .my.cnf because it did not exist."
  fi
}
