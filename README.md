# Basher Framework

```
______  _______ _______ _     _ _______  ______
|_____] |_____| |______ |_____| |______ |_____/
|_____] |     | ______| |     | |______ |    \_
```

https://imgur.com/a/GNsxOb5

- Add Zsh Plugin: ~/.oh-my-zsh/custom/includeProfileApp.zsh
- Add to to: ~/.profile

```shell script
#!/usr/bin/env bash
export BASHER_PATH="$HOME/basher-framework"

# shellcheck source=$BASHER_PATH/app.sh
source "$BASHER_PATH/app.sh"
```
Or Standalone
```shell script
/usr/bin/env bash ~/basher-framework/app.sh
```
---

## Config

See env.default.sh
```shell script
#!/usr/bin/env bash
# Comment Out to Hide Basher Banner
export BASHER_BANNER=true

# Add Command Aliases
alias artisan='php artisan'

# GIT Environment Vars
export GIT_AUTHOR_NAME="Dan Alvidrez"
export GIT_AUTHOR_EMAIL="dan@bayareawebpro.com"

# BASHER Environment Vars
export BASHER_GIT_USER="bayareawebpro"
export BASHER_PROJECTS="$HOME/Sites"

# Launch Chrome Using Faux HTTPS
export BASHER_CHROME_SECURE=true

# Define Database Auth or you will be prompted.
export BASHER_DB_USER="root"
export BASHER_DB_PASS="root"
```

#### Projects
```shell script
make:project my-folder-name
switch:project my-folder-name
make:laravel my-folder-name
```

#### Database Commands
```shell script
make:database:env my_database
make:myconf
```
```shell script
has:database my_database
drop:database my_database
make:database my_database
database:export my_database ~/
database:import my_database ~/backup.sql
```
---
#### Installers
```shell script
install:animatecss
install:tailwindcss
install:vuejs
```
---

## GIT
Create Repo in CWD
```shell script
git:setup
git:connect
git:ignore
git:readme
git:save
git:save "custom message"
git:sync
git:reset
git:branch dev
git:branch gh-pages fresh
git:branch:delete dev
git:switch master
```
---

## Chrome
> No argument for 127.0.0.1
```shell script
chrome:serve
chrome:serve "test.local"
```
---

## PhpStorm
Launch PhpStorm
```shell script
phpstorm:launch
phpstorm:open $PWD
```
---

## Code Quality
```shell script
php:quality # php:lint && php:test
php:lint
php:test
php:dusk
```
---

## App
```shell script
app:test
app:boot
app:reboot
```

```shell script
app:publish "resources/.myconf" "$HOME/.myconf"
```

## Require
Require scripts from the app directory.
```shell script
app:require "services/service.sh"
app:require:all "my_dir"
```

### Remote
```shell script
remote:require "http://some.app/script.sh"
remote:ping "http://some.app"
```

## Functions
```shell script
func:exists "my:func"
func:inspect "my:func"
```

See Unit Tests
```shell script
func:success # Last Command Succeeded
func:failed # Last Command Failed
```

## Numbers
```shell script
num:is:equal 1 1
num:not:equal 1 2
num:less:than 0 1
num:greater:than 3 2
num:less:or:equal 1 2
num:greater:or:equal 3 2
```

## Strings
```shell script
str:empty ""
str:filled "not empty"
str:is:equal "my-string" "my-string"
str:not:equal "my-string" "other-string"
str:matches:regex "123" '^[0-9]+$'
str:matches:regex "asd" '^[0-9]+$'

str:replace:first $TEXT $FIND $REPLACE
str:replace:all $TEXT $FIND $REPLACE

str:length $TEXT
str:slice $TEXT 0 3

str:prefix "text-file.txt" "text-" # file.txt
str:suffix "text-file.txt" ".txt" # text-file

str:upper "test"
str:lower "TEST"
```

## Collections
Collection state is global.
```shell script
collect:make # Empty
collect:count
collect:push "Apple"
collect:push "Banana"
collect:push "Orange"
collect:all

collect:set 1 "Pizza"
collect:all

for val in $(collect:filter "Pizza"); do
  echo "Collection Has $val"
done
```

## Filesystem

```shell script
path:base $FILE
path:filename $FILE
path:extension $FILE

path:is:file $FILE
path:is:directory $DIR
```

```shell script
make:archive '/path/to/output.zip' $DIR
```

```shell script
file:exists $FILE

file:is:executable $FILE
file:make:executable $FILE

file:is:writable $FILE
file:is:readable $FILE
file:is:symlink $FILE
file:not:empty $FILE

file:is:newer $FILE_A $FILE_B
file:is:older $FILE_A $FILE_B
file:equals $FILE_A $FILE_B

file:get $FILE
file:put $CONTENT $FILE
file:append $CONTENT $FILE
file:read $FILE

file:remove $FILE
file:remove:force $FILE
```

```shell script
directory:list .
directory:files .
directory:folders .
directory:remove $DIR
directory:force:remove $DIR
directory:change $DIR
directory:make $DIR
directory:previous
directory:trim ~/Downloads 1 # Older than 1 day, with confirm
directory:trim ~/Downloads 1 true # With no confirm
```

```shell script
for FILE in $(directory:files "."); do
  logger:text "$FILE"
done
for FOLDER in $(directory:folders "."); do
  logger:text "$FOLDER"
done
```

## RClone
```shell script
rclone:install
rclone:config
rclone:config:edit
rclone:sync my-sftp-connection /home/forge $DESTINATION $LOG_FILE_PATH
rclone:sync:cdn my-cdn-connection my-bucket $DESTINATION $LOG_FILE_PATH

```
---

## Processes
```shell script
process:status my-script.sh
process:watch my-script.sh # start if not running
process:start my-script.sh # create my-script.sh.lock
process:stop my-script.sh # remove my-script.sh.lock
process:log my-script.sh # read my-script.sh.log
```
```shell script
if process:running my-script.sh; then
  process:log my-script.sh 
fi
```

## CronTab
```shell script
cron:list
cron:install my-script.sh
cron:uninstall my-script.sh
```
```shell script
if cron:has my-script.sh; then
  logger:success "cron:has my-script.sh"
fi
```
---

## Logger
```shell script
logger:divider
logger:blank
logger:debug "Hmmm..."
logger:text "ok..."
logger:info "ready."
logger:error "Error!"
logger:alert "Security!"
logger:failed "Failed!"
logger:denied "Darn."
logger:warning "Failing..."
logger:success "Cool!"
logger:celebrate "Awesome!"
```

Input
```shell script
logger:input "Where to?" "ANSWER"
logger:success "Result: $ANSWER."
```

Confirmation
```shell script
if logger:confirm "Are you sure?"; then
  logger:success "Completed."
else
  logger:failed "Aborted."
fi
```

Colors
```shell script
colors:black "im black"
colors:blackb "im blackb"
colors:white "im white"
colors:whiteb "im whiteb"

colors:red "im red"
colors:redb "im redb"
colors:green "im green"
colors:greenb "im greenb"
colors:yellow "im yellow"
colors:yellowb "im yellowb"

colors:blue "im blue"
colors:blueb "im blueb"
colors:purple "im purple"
colors:purpleb "im purpleb"
colors:lightblue "im lightblue"
colors:lightblueb "im lightblueb"
```
