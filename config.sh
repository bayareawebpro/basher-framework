# Java / Elastic Search
export JAVA_HOME=/usr/bin/java
export ES_HOME=/usr/local/bin/elasticsearch
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# Composer
export PATH=~/.composer/vendor/bin:$PATH

# MAMP / PHP
alias php='/Applications/MAMP/bin/php/php7.3.7/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php7.3.7.ini"'
alias pear='/Applications/MAMP/bin/php/php7.3.7/bin/pear'
alias pecl='/Applications/MAMP/bin/php/php7.3.7/bin/pecl'

# MAMP / MySQL
alias mysql='/Applications/MAMP/Library/bin/mysql'
alias mysqldump='/Applications/MAMP/Library/bin/mysqldump'
alias mysqladmin='/Applications/MAMP/Library/bin/mysqladmin'

# Artisan
alias artisan='php artisan'