#!/usr/bin/env bash

# WIP
#local PROCESS_ROOT=""
#local PROCESS_USER="builder"
#local PROCESS_START="/usr/local/bin/node /usr/local/bin/laravel-echo-server start"
#local PROCESS_OUTPUT="$PWD/process-output.log"
#local PROCESS_PID_FILE="$PWD/process.pid"
#local PROCESS_PID=$(cat ${PID})

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
