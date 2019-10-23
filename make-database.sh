#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info

has:database(){
  [[ -n $(echo "SHOW DATABASES LIKE '$1';" | mysql) ]]
}

make:database() {
  local DATABASE
  DATABASE="${1//-/_}"
  logger:divider
  logger:info "Creating Database..."

  if string:is:empty "$DATABASE"; then
    logger:error "Database Name not defined."
    return 1
  fi
  if has:database "$DATABASE"; then
    logger:warning "Database Name: $DATABASE already exists."
    make:database:env "$DATABASE"
    return 0
  fi
  if echo "CREATE DATABASE $DATABASE;" | mysql; then
    #echo "CREATE USER $DB_USER@localhost IDENTIFIED BY '$DB_PASSWORD';" | mysql -v
    #echo "GRANT ALL PRIVILEGES ON $1.* to $1@localhost;" | mysql -v
    #echo "FLUSH PRIVILEGES;" | mysql
    make:database:env "$DATABASE"
    logger:success "Database created successfully."
  else
    logger:error "Database Name: $DATABASE failed to be created." && return 1
  fi
}

drop:database() {
  local DATABASE
  DATABASE="${1//-/_}"
  if [ -z "$DATABASE" ]; then
    logger:error "Database Name not defined." && exit 1
  elif echo "DROP DATABASE $DATABASE;" | mysql; then
    logger:success "Database dropped successfully."
  else
    logger:error "Database Name: $DATABASE failed to be dropped." && exit 1
  fi
}

make:database:env() {
  if string:not:empty "$1"; then
    local DB_DATABASE; DB_DATABASE=$1
  elif string:is:empty "$DB_DATABASE"; then
    logger:input "Enter DB_DATABASE:" "DB_DATABASE"
  fi

  if string:not:empty "$2"; then
    local DB_USERNAME; DB_USERNAME=$2
  elif string:is:empty "$DB_USERNAME"; then
    logger:input "Enter DB_USERNAME:" "DB_USERNAME"
  fi

  if string:not:empty "$3"; then
    local DB_PASSWORD; DB_PASSWORD=$3
  elif string:is:empty "$DB_PASSWORD"; then
    logger:input "Enter DB_PASSWORD:" "DB_PASSWORD"
  fi

  if path:is:file ".env"; then
    sed -i '' "s/DB_DATABASE=laravel$/DB_DATABASE=$DB_DATABASE/" .env
    sed -i '' "s/DB_USERNAME=root$/DB_USERNAME=$DB_USERNAME/" .env
    sed -i '' "s/DB_PASSWORD=$/DB_PASSWORD=$DB_PASSWORD/" .env
    logger:success ".env file configured to use $DB_DATABASE, $DB_USERNAME, $DB_PASSWORD."
  else
    logger:warning ".env file not found you'll need to set it up youself."
  fi
}