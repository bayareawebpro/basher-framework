#!/usr/bin/env bash
function supervisor:install() {
  logger:divider
  if progam:exists "brew"; then
    logger:info "Installing Supervisor with Brew..."
    brew update && brew install supervisor

  elif progam:exists "pip"; then
    logger:info "Installing Supervisor with PIP..."
    pip install supervisor

  else
    logger:failed "No available installation methods dectected."
    logger:info "Brew or PIP Required."
  fi
}

function supervisor:start() {
  logger:divider
  logger:info "Starting Supervisor..."
  echo "" >"$BASHER_PATH/storage/logs/supervisord.log"
  supervisord -c "$BASHER_PATH/resources/supervisord/supervisord.conf"
  sleep 3 && supervisor:logs
}

function supervisor:stop() {
  logger:divider
  logger:info "Stopping Supervisor..."
  local PID="$(supervisor:pid)"
  if str:filled "$PID" && kill -s SIGTERM "$PID"; then
    logger:success "Stopped Supervisor @ $PID"
  else
    logger:warning "Stopping Supervisor Failed, Is it running?."
  fi
  sleep 3 && supervisor:logs
}

function supervisor:control() {
  supervisord -c "$BASHER_PATH/resources/supervisord/supervisord.conf"
}

function supervisor:logs() {
  file:read "$BASHER_PATH/storage/logs/supervisord.log"
}

function supervisor:pid() {
  pgrep -f supervisord
}