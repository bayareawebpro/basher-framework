#!/usr/bin/env bash

function on:database:created() {
  logger:debug "on:database:created (define function to use hook)"
}
function on:database:dropped() {
  logger:debug "on:database:dropped (define function to use hook)"
}

# Publish MySql Config
function make:myconf() {
  if path:is:file "$HOME/.my.cnf"; then
    logger:warning "$HOME/.my.cnf is already configured."
    return 1
  elif ! path:is:file "$BASHER_PATH/resources/template-mysql.cnf"; then
    logger:failed "$BASHER_PATH/resources/template-mysql.cnf does not exist."
    return 1
  else
    file:copy "$BASHER_PATH/resources/template-mysql.cnf" "$HOME/.my.cnf"
    logger:success "Installed .my.cnf because it did not exist."
  fi
}

# Has Database?
function has:database() {
  [[ -n $(echo "SHOW DATABASES LIKE '$1';" | mysql) ]]
}

# Make New Database
function make:database() {
  local DATABASE="${1//-/_}"

  logger:divider
  logger:info "Creating Database..."

  if str:empty "$DATABASE"; then
    logger:warning "Database Name not defined."
    logger:input "Enter DATABASE:" "DATABASE"
  fi

  if has:database "$DATABASE"; then
    logger:warning "Database Name: $DATABASE already exists."
    make:database:env
    return 1
  fi

  if echo "CREATE DATABASE $DATABASE;" | mysql; then
    logger:success "Database $DATABASE created successfully."

    if str:empty "$2" && logger:confirm "Would you like to configure the environment file?"; then
      make:database:env "$DATABASE"
    fi
    if func:exists "on:database:created"; then
      on:database:created "$DATABASE"
    fi
  else
    logger:failed "Database Name: $DATABASE failed to be created."
    return 1
  fi
}

# Drop Existing Database
function drop:database() {
  local DATABASE="${1//-/_}"

  logger:divider
  logger:info "Dropping Database..."

  if str:empty "$DATABASE"; then
    logger:input "Enter DATABASE:" "DATABASE"
  fi

  if ! has:database "$DATABASE"; then
      logger:failed "Database $DATABASE does not exist."
  fi

  if echo "DROP DATABASE $DATABASE;" | mysql; then
      logger:success "Database $DATABASE dropped successfully."
      if func:exists "on:database:dropped"; then
        on:database:dropped "$DATABASE"
      fi
    else
      logger:failed "Database $DATABASE failed to be dropped."
      return 1
    fi
}

# Make Database Environment
function make:database:env() {
  logger:divider
  logger:info "Configuring Database Environment File..."

  if str:filled "$1"; then
    local BASHER_DATABASE=$1
  elif str:empty "$BASHER_DATABASE"; then
    logger:input "Enter DB_DATABASE:" "DATABASE"
  fi

  if str:filled "$2"; then
    local BASHER_DB_USER=$2
  elif str:empty "$BASHER_DB_USER"; then
    logger:input "Enter DB_USERNAME:" "BASHER_DB_USER"
  fi

  if str:filled "$3"; then
    local BASHER_DB_PASS=$3
  elif str:empty "$BASHER_DB_PASS"; then
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
