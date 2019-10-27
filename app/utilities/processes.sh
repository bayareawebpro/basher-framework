#!/usr/bin/env bash
function process:running() {
  if str:empty "$1"; then
    logger:denied "Argument 1 (Executable Path) not specified."
    return 1
  fi
  pgrep -f "$1" >/dev/null
}

function process:status() {
  if str:empty "$1"; then
    logger:denied "Argument 1 (Executable Path) not specified."
  fi
  if process:running "$1"; then
    logger:info "Process ID $(basename "$1") is running."
    for pid in $(process:running "$1"); do
      echo "$pid"
    done
    return 0
  fi
  logger:info "Process ID $(basename "$1") not running."
  return 1
}

# Start Process
function process:start() {
  logger:divider && logger:info "Starting Process..."

  if str:empty "$1"; then
    logger:denied "Argument 1 (Executable Path) not specified."
    return 1
  fi

  if process:running "$1"; then
    logger:warning "Killing sibling process..."
    process:stop "$1"
  fi

  if ! file:is:executable "$1" && ! file:make:executable "$1"; then
    logger:warning "File $1 is not Executable."
    return 1
  fi

  local FILE=$(basename "$1")
  logger:warning "Starting Process $FILE..."
  if ($1 >"$1.log" 2>&1 & echo $! > "$1.lock" & chmod 644 "$1.lock"); then
    logger:success "Process $FILE launched."
  else
    logger:error "Process $FILE failed to launch."
  fi
}

# Display Process Log
function process:log(){
  if str:empty "$1"; then
    logger:denied "Argument 1 (Executable Path) not specified."
    return 1
  fi
  logger:divider
  logger:info "Reading Process Log $(basename "$1")..."
  file:read "$1.log"
}

# Restart Process if Stopped
function process:watch() {
  if ! process:running "$1"; then
    process:start "$1"
  fi
}

# Stop Running Process
function process:stop() {
  local FILE="$(basename "$1")"
  logger:warning "Stopping Process $FILE..."
  if pkill -F "$1.lock" && rm -f "$1.lock"; then
    logger:success "Stopped $FILE.lock..."
  else
    logger:failed "Failed to stop PID $pid"
    return 1
  fi
  for pid in $(pgrep -f "$1"); do
    if kill -9 "$pid"; then
      logger:success "Stopped Sibling PID $pid..."
    else
      logger:failed "Failed to stop PID $pid"
      return 1
    fi
  done
}
