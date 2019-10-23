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
    #echo "CREATE USER $1@localhost IDENTIFIED BY '$1';" | mysql -v
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
  if [ -z "$1" ]; then
    logger:error "Database Name: $1 not defined." && exit 1
  else
    if test -f '.env'; then
      #sed -i '' "s/DB_USERNAME=root$/DB_USERNAME=$1/" .env
      sed -i '' "s/DB_PASSWORD=$/DB_PASSWORD=root/" .env
      sed -i '' "s/DB_DATABASE=laravel$/DB_DATABASE=$1/" .env
      logger:success ".env file configured to use $1."
    else
      logger:warning ".env file not found you'll need to set it up youself."
    fi
  fi
}