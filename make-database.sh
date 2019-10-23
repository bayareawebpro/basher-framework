#!/usr/bin/env bash
#logger:blank
#logger:divider
#logger:success
#logger:warning
#logger:error
#logger:debug
#logger:info

database:create() {
  if [ -z "$1" ]; then
    logger:error "Database Name: $1 not defined." && exit 1
  else
    echo "CREATE DATABASE $1;" | $(which mysql)
    #echo "CREATE USER $1@localhost IDENTIFIED BY '$1';" | mysql -v
    #echo "GRANT ALL PRIVILEGES ON $1.* to $1@localhost;" | mysql -v
    #echo "FLUSH PRIVILEGES;" | mysql
  fi
}

database:env() {
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