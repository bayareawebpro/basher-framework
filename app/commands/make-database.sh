#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:failed
#logger:debug
#logger:info

function make:database:myconf() {
  if path:is:file "$HOME/.my.cnf"; then
    logger:warning "$HOME/.my.cnf is already configured."
  else
    file:copy "$BASHER_PATH/res/.my.cnf" "$HOME/.my.cnf"
    logger:warning "Installed .my.cnf because it did not exist."
  fi
}

function has:database() {
  [[ -n $(echo "SHOW DATABASES LIKE '$1';" | mysql) ]]
}

function make:database() {
  local DATABASE="${1//-/_}"

  logger:divider
  logger:info "Creating Database..."

  if string:is:empty "$DATABASE"; then
    logger:warning "Database Name not defined."
    logger:input "Enter DATABASE:" "DATABASE"
  fi

  if has:database "$DATABASE"; then
    logger:warning "Database Name: $DATABASE already exists."
    if logger:confirm "Would you like to configure the environment file instead?"; then
      make:database:env "$DATABASE"
    fi
  elif echo "CREATE DATABASE $DATABASE;" | mysql; then
    if logger:confirm "Would you like to configure the environment file?"; then
      make:database:env "$DATABASE"
    fi
    logger:success "Database created successfully."
    if func:exists "on:database:created"; then
      on:database:created "$DATABASE"
    fi
  else
    logger:failed "Database Name: $DATABASE failed to be created."
    return 1
  fi
}

function drop:database() {
  local DATABASE="${1//-/_}"
  if string:is:empty "$DATABASE"; then
    logger:input "Enter DATABASE:" "DATABASE"
  fi
  if (echo "DROP DATABASE $DATABASE;" | mysql); then
    logger:success "Database $DATABASE dropped successfully."
    if func:exists "on:database:dropped"; then
      on:database:dropped "$DATABASE"
    fi
  else
    logger:failed "Database $DATABASE failed to be dropped."
    return 1
  fi
}

function make:database:env() {
  if string:not:empty "$1"; then
    local BASHER_DATABASE=$1
  elif string:is:empty "$BASHER_DATABASE"; then
    logger:input "Enter DB_DATABASE:" "DATABASE"
  fi

  if string:not:empty "$2"; then
    local BASHER_DB_USER=$2
  elif string:is:empty "$BASHER_DB_USER"; then
    logger:input "Enter DB_USERNAME:" "BASHER_DB_USER"
  fi

  if string:not:empty "$3"; then
    local BASHER_DB_PASS=$3
  elif string:is:empty "$BASHER_DB_PASS"; then
    logger:input "Enter DB_PASSWORD:" "BASHER_DB_PASS"
  fi

  if path:is:file ".env"; then
    sed -i '' "s/DB_DATABASE=.*/DB_DATABASE=$BASHER_DATABASE/" .env
    sed -i '' "s/DB_USERNAME=.*$/DB_USERNAME=$BASHER_DB_USER/" .env
    sed -i '' "s/DB_PASSWORD=.*$/DB_PASSWORD=$BASHER_DB_PASS/" .env
    logger:success ".env file configured to use $BASHER_DATABASE, $BASHER_DB_USER, $BASHER_DB_PASS."
  else
    logger:warning ".env file not found you'll need to set it up youself."
  fi
}
