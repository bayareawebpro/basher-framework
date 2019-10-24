# Basher Framework

```
______  _______ _______ _     _ _______  ______
|_____] |_____| |______ |_____| |______ |_____/
|_____] |     | ______| |     | |______ |    \_
Version 1.x
```

https://imgur.com/a/GNsxOb5

- Add Zsh Plugin: ~/.oh-my-zsh/custom/includeProfileApp.zsh
- Or, add to to: ~/.profile
```shell script
source /Users/me/bash-profile/app.sh
```

🤖 BashApp Loaded & Ready To Build 😎

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

# Will destroy the previously created project when new one is created.
export BASHER_TESTING=true

# Launch Chrome Using Faux HTTP
export BASHER_CHROME_SECURE=true

# Define Database Auth or you will be prompted.
export BASHER_DB_USER="root"
export BASHER_DB_PASS="root"
```

## Conditionals
```shell script
string:is:empty ""
string:not:empty "not empty"
string:is:equal "my-string" "my-string"
string:not:equal "my-string" "other-string"
string:matches:regex "123" '^[0-9]+$'
string:matches:regex "asd" '^[0-9]+$'

num:is:equal 1 1
num:not:equal 1 2
num:less:than 0 1
num:greater:than 3 2
num:less:than:or:equal 1 2
num:greater:than:or:equal 3 2

func:exists "my:method"
```

## Filesystem
```shell script
path:is:file $PATH
path:is:directory $PATH
file:exists $PATH
file:readable $PATH
file:writable $PATH
file:executable $PATH
file:is:symlink $PATH
file:not:empty $PATH
file:newer:than $PATH_A $PATH_B
file:older:than $PATH_A $PATH_B
file:equal:to $PATH_A $PATH_B
directory:make $PATH_A
directory:change $PATH_A
directory:remove $PATH_A
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

#### Input
```shell script
logger:input "Where to?" "ANSWER"
logger:success "Result: $ANSWER."
```

#### Confirmation
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


## Project

#### Make Project (non macro)
```shell script
make:project "my-folder-name"
```

#### Make Laravel (macro)
- Makes Project
- Creates Database
- Sets Env Vars
- Ready to rock with a single command.

```shell script
make:laravel "my-folder-name"
```

#### Database Commands
```shell script
make:database "my_database"
make:database:env "my_database"

if has:database "git_test_output"; then
  drop:database "git_test_output"
fi
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
```

Set Origin to Master / CWD name must match repo name.
```shell script
git:connect
```

Ignore & ReadMe
Created if doesn't exist.
```shell script
git:ignore
git:readme
```

Save (push)
```shell script
git:save "custom message"
git:save (uses "wip" when no argument specified)
```

Sync (pull)
```shell script
git:sync
```
Revert to Head (Hard)
```shell script
git:reset
```

Full Branch
```shell script
git:branch dev
```
Fresh Branch
```shell script
git:branch gh-pages fresh
```
Switching Branches
```shell script
git:switch master
```
Deleting Branches
```shell script
git:branch:delete dev
```

## Chrome
No argument for 127.0.0.1:8000

```shell script
chrome:serve
chrome:serve:secure
```

Or using an argument

```shell script
chrome:serve "test.local"
```
---
## PhpStorm

Launch PhpStorm
```shell script
phpstorm:launch
```

Open Project
```shell script
phpstorm:open $PWD
```
---
