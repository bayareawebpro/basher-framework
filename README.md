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
source /Users/me/basher-framework/app.sh
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

#### Make Project (non macro)
```shell script
make:project my-folder-name
```

#### Make Laravel (macro)
- Makes Project
- Creates Database
- Sets Env Vars
- Ready to rock with a single command.

```shell script
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
php:quality
php:lint
php:test
php:dusk
```
---

## App
```shell script
app:boot
app:reboot
app:test
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

## Conditionals
```shell script
func:exists "curl"
```

```shell script
func:success
func:failed
```

```shell script
str:empty ""
str:filled "not empty"
str:is:equal "my-string" "my-string"
str:not:equal "my-string" "other-string"
str:matches:regex "123" '^[0-9]+$'
str:matches:regex "asd" '^[0-9]+$'

str:slice $TEXT 0 3
str:replace:first $TEXT $FIND $REPLACE
str:replace:all $TEXT $FIND $REPLACE
str:length $TEXT

str:prefix "text-file.txt" "text-" # file.txt
str:suffix "text-file.txt" ".txt" # text-file

str:upper "test"
str:lower "TEST"
```

```shell script
num:is:equal 1 1
num:not:equal 1 2
num:less:than 0 1
num:greater:than 3 2
num:less:or:equal 1 2
num:greater:or:equal 3 2
```

## Filesystem

```shell script
for FILE in $(directory:files "."); do
  logger:text "$FILE"
done
for FOLDER in $(directory:folders "."); do
  logger:text "$FOLDER"
done
```

```shell script
path:is:file $PATH
path:is:directory $PATH
path:base $PATH
path:filename $PATH
path:extension $PATH
```

```shell script
file:exists $PATH
file:readable $PATH
file:read $PATH
file:writable $PATH
file:executable $PATH
file:is:symlink $PATH
file:not:empty $PATH
file:newer:than $PATH_A $PATH_B
file:older:than $PATH_A $PATH_B
file:equal:to $PATH_A $PATH_B
```

```shell script
directory:make $PATH_A
directory:change $PATH_A
directory:remove $PATH_A
directory:list .
directory:files .
directory:folders .
```
---

## Processes
```shell script
process:start my-script.sh
process:status my-script.sh
process:log my-script.sh
process:stop my-script.sh
```
```shell script
if process:running my-script.sh; then
  process:log my-script.sh
fi
```
Cron Command
```shell script
process:watch my-script.sh
```
---

## Logger
```shell script
logger:divider
logger:blank
logger:debug "Hmmm..."
logger:text "ok..."
logger:info "ready."
logger:success "Cool!"
logger:celebrate "ok..."
logger:warning "failing..."
logger:failed "failed!"
logger:error "error!"
logger:alert "security!"
logger:denied "darn."
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
