#!/usr/bin/env bash

# Get Running Process Status
# param $1 (number) PID
function process:running() {
  [[ -n "$(ps -p "$(cat "$1")" -o pid=)" ]]
}

# Process Status
# param $1 (number) PID
function process:status() {
  if process:running "$1"; then
    logger:success "Process ID $1 is running."
    return 0
  fi
  logger:warning "Process ID $1 not running."
  return 1
}

# Stop Running Process
# param $1 (number) PID
function process:start() {
    logger:warning "Starting Process $1 @ $2."

    if string:is:empty "$1"; then
      logger:denied "Argument 1 (Executable Path) not specified."
    fi

    if string:is:empty "$2"; then
      logger:denied "Argument 2 (PID Path) not specified."
    fi

    if $1 > /dev/null 2>&1 & echo $! > "$2" & chmod 644 "$2"; then
      logger:success "Process $1 @ $2 started."
    else
      logger:error "Process $1 @ $2 failed to start."
    fi
}

# Stop Running Process
# param $1 (number) PID
function process:stop() {
    if string:is:empty "$1"; then
      logger:denied "Argument 1 (PID) not specified."
    fi
    if string:is:empty "$2"; then
      logger:denied "Argument 2 (PID Path) not specified."
    fi

    logger:warning "Killing Process $1 @ $2."
    if kill -9 "$1" && rm -f "$2"; then
      logger:success "Process $1 @ $2 stopped."
    else
      logger:error "Process $1 @ $2 failed to be stopped."
    fi
}
