# Basher Framework

```
______  _______ _______ _     _ _______  ______
|_____] |_____| |______ |_____| |______ |_____/
|_____] |     | ______| |     | |______ |    \_
```

https://imgur.com/a/GNsxOb5

- Add Zsh Plugin: ~/.oh-my-zsh/custom/includeProfileApp.zsh
- Or, add to to: ~/.profile

```shell script
#!/usr/bin/env bash

# Incude Basher Framework
export BASHER_PATH="$HOME/basher-framework"

# shellcheck source=$BASHER_PATH/app.sh
source "$BASHER_PATH/app.sh"
```
Or Standalone
```shell script
/usr/bin/env bash ~/basher-framework/app.sh
```
---

# Application
```shell script
app:boot
app:reboot
app:test
```

Publish Assets & Configurations
```shell script
app:publish "resources/.myconf" "$HOME/.myconf"
```

Require scripts from the app directory.
```shell script
app:require "services/service.sh"
app:require:all "services"
```

Build MacOS Bundle & Output to Desktop.
```shell script
app:build
```
---

#### Datetime
```shell script
date:timestamp # 2019-10-28 06:00:52
date:filename  # 2019-10-28_06-01-02
date:humanized # 10/28/2019 06:01AM
```

#### Filesystem
```shell script
path:is:directory $DIR
path:is:file $FILE

path:extension $FILE
path:filename $FILE
path:base $FILE
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
directory:archive $DIR '/path/to/output.zip'
```

```shell script
for FILE in $(directory:files "."); do
  logger:debug "$FILE"
done
for FOLDER in $(directory:folders "."); do
  logger:debug "$FOLDER"
done
```

#### Numbers
```shell script
num:is:equal 1 1
num:not:equal 1 2
num:less:than 0 1
num:greater:than 3 2
num:less:or:equal 1 2
num:greater:or:equal 3 2
```

#### Strings
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

#### Collections
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

#### Functions
```shell script
func:exists "my:func"
func:inspect "my:func"
func:success # Last Command Succeeded
func:failed # Last Command Failed
```

#### Processes
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

#### Remote
```shell script
remote:require "http://some.app/script.sh"
remote:ping "http://some.app"
```

#### CronTab
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

#### Logger
```shell script
logger:divider
logger:blank
logger:debug "Hmmm..."
logger:debug "ok..."
logger:info "ready."
logger:error "Error!"
logger:alert "Security!"
logger:failed "Failed!"
logger:denied "Darn."
logger:warning "Failing..."
logger:success "Cool!"
logger:celebrate "Awesome!"
```

```shell script
logger:input "Where to?" "ANSWER"
logger:success "Result: $ANSWER."
```

```shell script
if logger:confirm "Are you sure?"; then
  logger:success "Completed."
else
  logger:failed "Aborted."
fi
```

#### Colors
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
------

## Services

#### Database
```shell script
make:database:env my_database
make:myconf

has:database my_database
drop:database my_database
make:database my_database

database:export my_database ~/
database:import my_database ~/backup.sql
```

#### GIT
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

#### Chrome
> No argument for 127.0.0.1
```shell script
chrome:serve
chrome:serve "test.local"
```

#### PhpStorm
```shell script
phpstorm:launch
phpstorm:open $PWD
```

#### Operating System (MacOS)
```shell script
os:speak "text"
os:notify "Title" "text"
os:confirm  "Title" "text"
```

#### Slack
```shell script
slack:notify "my-channel" "Yo." "#ff0000"
slack:success "my-channel" "Something went right."
slack:warning "my-channel" "Something is strange."
slack:failed "my-channel" "Something went wrong."
```

#### RClone
```shell script
rclone:install
rclone:config
rclone:config:edit
rclone:sync my-sftp-connection /home/forge $DESTINATION $LOG_FILE_PATH
rclone:sync:cdn my-cdn-connection my-bucket $DESTINATION $LOG_FILE_PATH
```
------

## Projects
```shell script
make:laravel my-folder-name
make:project my-folder-name
switch:project my-folder-name
```

#### Installers
```shell script
install:animatecss
install:tailwindcss
install:vuejs
```

#### Code Quality
```shell script
php:quality # php:lint && php:test
php:lint
php:test
php:dusk
```