#!/usr/bin/env bash
function on:database:created() {
  logger:debug "on:database:created (define function to use hook)"
}
function on:database:dropped() {
  logger:debug "on:database:dropped (define function to use hook)"
}

function database:import() {
  local DATABASE="${1//-/_}"
  local IMPORT_PATH="$2"
  logger:divider && logger:info "Importing Database..."
  if str:empty "$DATABASE"; then
    logger:warning "Database Name not defined."
    logger:input "Enter DATABASE:" "DATABASE"
  fi
  if str:empty "$IMPORT_PATH"; then
    logger:warning "Import path not defined."
    logger:input "Enter IMPORT_PATH:" "IMPORT_PATH"
  fi
  if (! file:exists "$IMPORT_PATH" || ! file:is:readable "$IMPORT_PATH"); then
    logger:failed "Import path ($IMPORT_PATH) is not readable or does not exist."
    return 1
  fi
  if mysql -e 'SET autocommit=0; USE `'"$DATABASE"'`; source '"$IMPORT_PATH"'; COMMIT;'; then
    logger:success "Database $DATABASE imported successfully."
  else
    logger:failed "Database: $DATABASE failed to be imported."
    return 1
  fi
}

function database:export() {
  local DATABASE="${1//-/_}"
  local EXPORT_PATH="$2"
  logger:divider && logger:info "Exporting Database..."
  if str:empty "$DATABASE"; then
    logger:warning "Database Name not defined."
    logger:input "Enter DATABASE:" "DATABASE"
  fi
  if ! has:database "$DATABASE"; then
    logger:failed "Database: $DATABASE does not exist or connection cannot be established."
    return 1
  fi
  if str:empty "$EXPORT_PATH"; then
    logger:warning "Database Name not defined."
    logger:input "Enter Export File Path:" "EXPORT_PATH"
  fi
  if mysqldump --single-transaction --no-create-db --quick --default-character-set=utf8mb4 "$DATABASE" >"$EXPORT_PATH"; then
    logger:success "Database $DATABASE exported to $EXPORT_PATH."
  else
    logger:failed "Database: $DATABASE failed to be exported."
    return 1
  fi
}

# Publish MySql Config
function make:myconf() {
  app:publish "resources/mysql.conf" "$HOME/.my.cnf"
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
