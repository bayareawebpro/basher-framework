#!/usr/bin/env bash

# Paths
export PATH=/Applications/MAMP/bin/php/php7.3.7/bin:$PATH
export PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Java / Elastic Search If Needed
#export JAVA_HOME=/usr/bin/java
#export ES_HOME=/usr/local/bin/elasticsearch
#export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# PHP Alias
#alias php='/Applications/MAMP/bin/php/php7.3.7/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php7.3.7.ini"'
#alias pear=/Applications/MAMP/bin/php/php7.3.7/bin/pear
#alias pecl=/Applications/MAMP/bin/php/php7.3.7/bin/pecl

# MySQL Alias
#alias mysql=/Applications/MAMP/Library/bin/mysql
#alias mysqldump=/Applications/MAMP/Library/bin/mysqldump
#alias mysqladmin=/Applications/MAMP/Library/bin/mysqladmin

# Artisan Alias
alias artisan='php artisan'

# GIT Environment Vars
export GIT_AUTHOR_NAME="Dan Alvidrez"
export GIT_AUTHOR_EMAIL="dan@bayareawebpro.com"

export GIT_USER="bayareawebpro"
export GIT_PROJECTS_PATH="$HOME/Sites"