#!/usr/bin/env bash

# Install Supervisor
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

# Start Supervisor Process
function supervisor:start() {
  logger:divider
  logger:info "Starting Supervisor..."
  echo "" >"$BASHER_PATH/storage/logs/supervisord.log"
  supervisord -c "$BASHER_PATH/resources/supervisord/supervisord.conf"
  sleep 3 && supervisor:logs
}

# Stop Supervisor Process
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

# Enter Process Control CLI
function supervisor:control() {
  supervisorctl -c "$BASHER_PATH/resources/supervisord/supervisord.conf"
}

# Read the Logs of the process.
function supervisor:logs() {
  file:read "$BASHER_PATH/storage/logs/supervisord.log"
}

# Get the PID of the process.
function supervisor:pid() {
  pgrep -f supervisord
}

# Install LaunchAgent (OSX)
function supervisor:install:agent() {
  launchctl load "$BASHER_PATH/resources/supervisord/com.process.supervisord.plist"
}

# UnInstall LaunchAgent (OSX)
function supervisor:uninstall:agent() {
  launchctl unload "$BASHER_PATH/resources/supervisord/com.process.supervisord.plist"
}


