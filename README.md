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

See config.sh
```shell script
# GIT Environment Vars
export GIT_AUTHOR_NAME="Your Name"
export GIT_AUTHOR_EMAIL="you@site.com"

# APP Environment Vars
export BASHER_GIT_USER="coolguy"
export BASHER_PROJECTS="$HOME/Sites"
```

## Project

#### Make Project (non macro)
```shell script
make:project "my-folder-name"
```

#### Make Laravel (macro)
- Makes Project
- Installs Tailwind Preset
- Creates Database
- Sets Env Vars
- Ready to rock with a sigle command.

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
```

---

## GIT

#### Create Repo in CWD
```shell script
git:setup
```

#### Set Origin to Master
CWD name must match repo name.
```shell script
git:connect
```

#### Ignore & ReadMe
Created if doesn't exist.
```shell script
git:ignore
git:readme
```

#### Save (push)
```shell script
git:save "custom message"
git:save (uses "wip" when no argument specified)
```

#### Sync (pull)
```shell script
git:sync
```

#### Branch
Full
```shell script
git:branch dev
```
Fresh
```shell script
git:branch gh-pages fresh
```
Switching
```shell script
git:switch master
```
Deleting
```shell script
git:branch:delete dev
```

#### Reset
Revert to Head (Hard)
```shell script
git:reset
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
chrome:serve:secure "test.local"
```

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
## Conditionals
```shell script
(string:is:empty "" && logger:success "string:is:empty") || logger:failed "string:is:empty"
(string:not:empty "not empty" && logger:success "string:not:empty") || logger:failed "string:not:empty"
(string:is:equal "my-string" "my-string" && logger:success "string:is:equal") || logger:failed  "string:is:equal"
(string:not:equal "my-string" "other-string" && logger:success "string:not:equal") || logger:failed "string:not:equal"
(string:matches:regex "123" '^[0-9]+$' && logger:success "string:matches:regex true") || logger:failed  "string:matches:regex true"
(string:matches:regex "asd" '^[0-9]+$' || logger:success "string:matches:regex false") || logger:failed "string:matches:regex false"

(num:is:equal 1 1 && logger:success "num:is:equal") || logger:failed "num:is:equal"
(num:not:equal 1 2 && logger:success "num:not:equal") || logger:failed "num:not:equal"
(num:less:than 0 1 && logger:success "num:less:than") || logger:failed "num:less:than"
(num:greater:than 3 2 && logger:success "num:greater:than") || logger:failed "num:greater:than"
(num:less:than:or:equal 1 2 && logger:success "num:less:than:or:equal") || logger:failed "num:less:than:or:equal"
(num:greater:than:or:equal 3 2 && logger:success "num:greater:than:or:equal") || logger:failed "num:greater:than:or:equal"

```
---
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

#### Divider
```shell script
logger:divider
===================================================================================================
```

#### Success: ✅ Cool! (green text)
```shell script
logger:success "Cool!"
```

#### Info: 🤖 Testing ready to start. (blue text)
```shell script
logger:info "Testing ready to start."

```

#### Warning: ⚠️ Tests failing... (yellow text)
```shell script
logger:warning "Tests failing..."
```

#### Error: 🤬 Testing failed! (red text)
```shell script
logger:failed "Testing failed!"
```

#### Debug: Hmmm... (grey text)
```shell script
logger:debug "Hmmm..."
```

#### Blank Line
```shell script
logger:blank
```

#### Colors
```
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

#### Git Commands Test Output
```
➜ 🤖 Initializing Local Repository...
Initialized empty Git repository in /Users/builder/Desktop/git-test-output/.git/
===================================================================================================
➜ 🤖 📡 Git Remote Connecting to ...
remote: Enumerating objects: 18, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 18 (delta 0), reused 16 (delta 0), pack-reused 0
Unpacking objects: 100% (18/18), done.
From github.com:bayareawebpro/git-test-output
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
➜ ✅  Git Remote is set to origin and syncronized: git@github.com:bayareawebpro/git-test-output.git.
Branch 'master' set up to track remote branch 'master' from 'origin'.
Everything up-to-date
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ⚠️️.gitignore already exists.
➜ 🤖 Creating README.md...
➜ ⚠️️README.md already exists.
===================================================================================================
➜ 🤖 Saving... WIP
[master f7dbccf] WIP
 1 file changed, 1 insertion(+)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 318 bytes | 318.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   aa3dcf4..f7dbccf  master -> master
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Creating Branch gh-pages...
Switched to a new branch 'gh-pages'
➜ ✅  Branch created successfully.
On branch gh-pages
nothing to commit, working tree clean
➜ ⚠️️Creating clean branch exit now or regret it, waiting 10 seconds...
rm '.gitignore'
rm 'README.md'
➜ ✅  Branch cleared.
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ✅  .gitignore Created!
➜ 🤖 Creating README.md...
➜ ✅  Created README.md!
Total 0 (delta 0), reused 0 (delta 0)
remote: 
remote: Create a pull request for 'gh-pages' on GitHub by visiting:
remote:      https://github.com/bayareawebpro/git-test-output/pull/new/gh-pages
remote: 
To github.com:bayareawebpro/git-test-output.git
 * [new branch]      gh-pages -> gh-pages
Branch 'gh-pages' set up to track remote branch 'gh-pages' from 'origin'.
===================================================================================================
➜ 🤖 Saving... WIP
[gh-pages 4fc6787] WIP
 1 file changed, 1 insertion(+), 1 deletion(-)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 314 bytes | 314.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   f7dbccf..4fc6787  gh-pages -> gh-pages
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Creating Branch dev...
Switched to a new branch 'dev'
➜ ✅  Branch created successfully.
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ⚠️️.gitignore already exists.
➜ 🤖 Creating README.md...
➜ ⚠️️README.md already exists.
Total 0 (delta 0), reused 0 (delta 0)
remote: 
remote: Create a pull request for 'dev' on GitHub by visiting:
remote:      https://github.com/bayareawebpro/git-test-output/pull/new/dev
remote: 
To github.com:bayareawebpro/git-test-output.git
 * [new branch]      dev -> dev
Branch 'dev' set up to track remote branch 'dev' from 'origin'.
===================================================================================================
➜ 🤖 Saving... WIP
[dev 53666af] WIP
 1 file changed, 1 insertion(+)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 316 bytes | 316.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   4fc6787..53666af  dev -> dev
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Switching Branch to master...
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
➜ ✅  Switched to master
===================================================================================================
➜ 🤖 Deleting Branch...
53666afd2a3c48feb75404ad3bb1eb444c0ffa1a refs/heads/dev
To github.com:bayareawebpro/git-test-output.git
 - [deleted]         dev
➜ ✅  Branch Deleted Successfully!
===================================================================================================
➜ 🤖 Deleting Branch...
4fc678770d4e8531b4ce1ada369a35860522f07d refs/heads/gh-pages
To github.com:bayareawebpro/git-test-output.git
 - [deleted]         gh-pages
➜ ✅  Branch Deleted Successfully!
```


## Make Commands Test Output
- Make Laravel 
- Project & Database
- GIT

```
➜ 🤖 Making Project...
➜ 🤖 Verifying Project Directory: /Users/builder/Sites/git-test-output
➜ ✅  git-test-output @ /Users/builder/Sites/git-test-output
===================================================================================================
➜ 🤖 Running Composer Install
Installing laravel/laravel (v5.8.35)
  - Installing laravel/laravel (v5.8.35): Loading from cache
Created project in .
> @php -r "file_exists('.env') || copy('.env.example', '.env');"
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 80 installs, 0 updates, 0 removals
  - Installing symfony/polyfill-ctype (v1.12.0): Loading from cache
  - Installing phpoption/phpoption (1.5.0): Loading from cache
  - Installing vlucas/phpdotenv (v3.6.0): Loading from cache
  - Installing symfony/css-selector (v4.3.5): Loading from cache
  - Installing tijsverkoyen/css-to-inline-styles (2.2.1): Loading from cache
  - Installing symfony/polyfill-php72 (v1.12.0): Loading from cache
  - Installing symfony/polyfill-mbstring (v1.12.0): Loading from cache
  - Installing symfony/var-dumper (v4.3.5): Loading from cache
  - Installing symfony/routing (v4.3.5): Loading from cache
  - Installing symfony/process (v4.3.5): Loading from cache
  - Installing symfony/polyfill-php73 (v1.12.0): Loading from cache
  - Installing symfony/polyfill-intl-idn (v1.12.0): Loading from cache
  - Installing symfony/mime (v4.3.5): Loading from cache
  - Installing symfony/http-foundation (v4.3.5): Loading from cache
  - Installing symfony/event-dispatcher-contracts (v1.1.7): Loading from cache
  - Installing psr/container (1.0.0): Loading from cache
  - Installing symfony/event-dispatcher (v4.3.5): Loading from cache
  - Installing psr/log (1.1.0): Loading from cache
  - Installing symfony/debug (v4.3.5): Loading from cache
  - Installing symfony/http-kernel (v4.3.5): Loading from cache
  - Installing symfony/finder (v4.3.5): Loading from cache
  - Installing symfony/service-contracts (v1.1.7): Loading from cache
  - Installing symfony/console (v4.3.5): Loading from cache
  - Installing symfony/polyfill-iconv (v1.12.0): Loading from cache
  - Installing doctrine/lexer (1.0.2): Loading from cache
  - Installing egulias/email-validator (2.1.11): Loading from cache
  - Installing swiftmailer/swiftmailer (v6.2.1): Loading from cache
  - Installing paragonie/random_compat (v9.99.99): Loading from cache
  - Installing ramsey/uuid (3.8.0): Loading from cache
  - Installing psr/simple-cache (1.0.1): Loading from cache
  - Installing opis/closure (3.4.1): Loading from cache
  - Installing symfony/translation-contracts (v1.1.7): Loading from cache
  - Installing symfony/translation (v4.3.5): Loading from cache
  - Installing nesbot/carbon (2.25.3): Loading from cache
  - Installing monolog/monolog (1.25.1): Loading from cache
  - Installing league/flysystem (1.0.57): Loading from cache
  - Installing erusev/parsedown (1.7.3): Loading from cache
  - Installing dragonmantank/cron-expression (v2.3.0): Loading from cache
  - Installing doctrine/inflector (v1.3.0): Loading from cache
  - Installing laravel/framework (v5.8.35): Loading from cache
  - Installing fideloper/proxy (4.2.1): Loading from cache
  - Installing jakub-onderka/php-console-color (v0.2): Loading from cache
  - Installing jakub-onderka/php-console-highlighter (v0.4): Loading from cache
  - Installing dnoegel/php-xdg-base-dir (0.1): Loading from cache
  - Installing nikic/php-parser (v4.2.4): Loading from cache
  - Installing psy/psysh (v0.9.9): Loading from cache
  - Installing laravel/tinker (v1.0.10): Loading from cache
  - Installing beyondcode/laravel-dump-server (1.3.0): Loading from cache
  - Installing fzaninotto/faker (v1.8.0): Loading from cache
  - Installing hamcrest/hamcrest-php (v2.0.0): Loading from cache
  - Installing mockery/mockery (1.2.4): Loading from cache
  - Installing filp/whoops (2.5.0): Loading from cache
  - Installing nunomaduro/collision (v3.0.1): Loading from cache
  - Installing sebastian/version (2.0.1): Loading from cache
  - Installing sebastian/resource-operations (2.0.1): Loading from cache
  - Installing sebastian/object-reflector (1.1.1): Loading from cache
  - Installing sebastian/recursion-context (3.0.0): Loading from cache
  - Installing sebastian/object-enumerator (3.0.3): Loading from cache
  - Installing sebastian/global-state (2.0.0): Loading from cache
  - Installing sebastian/exporter (3.1.2): Loading from cache
  - Installing sebastian/environment (4.2.2): Loading from cache
  - Installing sebastian/diff (3.0.2): Loading from cache
  - Installing sebastian/comparator (3.0.2): Loading from cache
  - Installing phpunit/php-timer (2.1.2): Loading from cache
  - Installing phpunit/php-text-template (1.2.1): Loading from cache
  - Installing phpunit/php-file-iterator (2.0.2): Loading from cache
  - Installing theseer/tokenizer (1.1.3): Loading from cache
  - Installing sebastian/code-unit-reverse-lookup (1.0.1): Loading from cache
  - Installing phpunit/php-token-stream (3.1.1): Loading from cache
  - Installing phpunit/php-code-coverage (6.1.4): Loading from cache
  - Installing doctrine/instantiator (1.2.0): Loading from cache
  - Installing webmozart/assert (1.5.0): Loading from cache
  - Installing phpdocumentor/reflection-common (2.0.0): Loading from cache
  - Installing phpdocumentor/type-resolver (1.0.1): Loading from cache
  - Installing phpdocumentor/reflection-docblock (4.3.2): Loading from cache
  - Installing phpspec/prophecy (1.9.0): Loading from cache
  - Installing phar-io/version (2.0.1): Loading from cache
  - Installing phar-io/manifest (1.0.3): Loading from cache
  - Installing myclabs/deep-copy (1.9.3): Loading from cache
  - Installing phpunit/phpunit (7.5.16): Loading from cache
symfony/var-dumper suggests installing ext-intl (To show region name in time zone dump)
symfony/routing suggests installing symfony/config (For using the all-in-one router or any loader)
symfony/routing suggests installing symfony/yaml (For using the YAML loader)
symfony/routing suggests installing symfony/expression-language (For using expression matching)
symfony/routing suggests installing doctrine/annotations (For using the annotation loader)
symfony/polyfill-intl-idn suggests installing ext-intl (For best performance)
symfony/event-dispatcher-contracts suggests installing psr/event-dispatcher
symfony/event-dispatcher suggests installing symfony/dependency-injection
symfony/http-kernel suggests installing symfony/browser-kit
symfony/http-kernel suggests installing symfony/config
symfony/http-kernel suggests installing symfony/dependency-injection
symfony/service-contracts suggests installing symfony/service-implementation
symfony/console suggests installing symfony/lock
egulias/email-validator suggests installing ext-intl (PHP Internationalization Libraries are required to use the SpoofChecking validation)
swiftmailer/swiftmailer suggests installing ext-intl (Needed to support internationalized email addresses)
swiftmailer/swiftmailer suggests installing true/punycode (Needed to support internationalized email addresses, if ext-intl is not installed)
paragonie/random_compat suggests installing ext-libsodium (Provides a modern crypto API that can be used to generate random bytes.)
ramsey/uuid suggests installing ircmaxell/random-lib (Provides RandomLib for use with the RandomLibAdapter)
ramsey/uuid suggests installing ext-libsodium (Provides the PECL libsodium extension for use with the SodiumRandomGenerator)
ramsey/uuid suggests installing ext-uuid (Provides the PECL UUID extension for use with the PeclUuidTimeGenerator and PeclUuidRandomGenerator)
ramsey/uuid suggests installing moontoast/math (Provides support for converting UUID to 128-bit integer (in string form).)
ramsey/uuid suggests installing ramsey/uuid-doctrine (Allows the use of Ramsey\Uuid\Uuid as Doctrine field type.)
ramsey/uuid suggests installing ramsey/uuid-console (A console application for generating UUIDs with ramsey/uuid)
symfony/translation suggests installing symfony/config
symfony/translation suggests installing symfony/yaml
monolog/monolog suggests installing graylog2/gelf-php (Allow sending log messages to a GrayLog2 server)
monolog/monolog suggests installing sentry/sentry (Allow sending log messages to a Sentry server)
monolog/monolog suggests installing doctrine/couchdb (Allow sending log messages to a CouchDB server)
monolog/monolog suggests installing ruflin/elastica (Allow sending log messages to an Elastic Search server)
monolog/monolog suggests installing php-amqplib/php-amqplib (Allow sending log messages to an AMQP server using php-amqplib)
monolog/monolog suggests installing ext-amqp (Allow sending log messages to an AMQP server (1.0+ required))
monolog/monolog suggests installing ext-mongo (Allow sending log messages to a MongoDB server)
monolog/monolog suggests installing mongodb/mongodb (Allow sending log messages to a MongoDB server via PHP Driver)
monolog/monolog suggests installing aws/aws-sdk-php (Allow sending log messages to AWS services like DynamoDB)
monolog/monolog suggests installing rollbar/rollbar (Allow sending log messages to Rollbar)
monolog/monolog suggests installing php-console/php-console (Allow sending log messages to Google Chrome)
league/flysystem suggests installing league/flysystem-eventable-filesystem (Allows you to use EventableFilesystem)
league/flysystem suggests installing league/flysystem-rackspace (Allows you to use Rackspace Cloud Files)
league/flysystem suggests installing league/flysystem-azure (Allows you to use Windows Azure Blob storage)
league/flysystem suggests installing league/flysystem-webdav (Allows you to use WebDAV storage)
league/flysystem suggests installing league/flysystem-aws-s3-v2 (Allows you to use S3 storage with AWS SDK v2)
league/flysystem suggests installing league/flysystem-aws-s3-v3 (Allows you to use S3 storage with AWS SDK v3)
league/flysystem suggests installing spatie/flysystem-dropbox (Allows you to use Dropbox storage)
league/flysystem suggests installing srmklive/flysystem-dropbox-v2 (Allows you to use Dropbox storage for PHP 5 applications)
league/flysystem suggests installing league/flysystem-cached-adapter (Flysystem adapter decorator for metadata caching)
league/flysystem suggests installing league/flysystem-sftp (Allows you to use SFTP server storage via phpseclib)
league/flysystem suggests installing league/flysystem-ziparchive (Allows you to use ZipArchive adapter)
laravel/framework suggests installing ext-pcntl (Required to use all features of the queue worker.)
laravel/framework suggests installing aws/aws-sdk-php (Required to use the SQS queue driver and SES mail driver (^3.0).)
laravel/framework suggests installing doctrine/dbal (Required to rename columns and drop SQLite columns (^2.6).)
laravel/framework suggests installing guzzlehttp/guzzle (Required to use the Mailgun and Mandrill mail drivers and the ping methods on schedules (^6.0).)
laravel/framework suggests installing league/flysystem-aws-s3-v3 (Required to use the Flysystem S3 driver (^1.0).)
laravel/framework suggests installing league/flysystem-cached-adapter (Required to use the Flysystem cache (^1.0).)
laravel/framework suggests installing league/flysystem-rackspace (Required to use the Flysystem Rackspace driver (^1.0).)
laravel/framework suggests installing league/flysystem-sftp (Required to use the Flysystem SFTP driver (^1.0).)
laravel/framework suggests installing moontoast/math (Required to use ordered UUIDs (^1.1).)
laravel/framework suggests installing nexmo/client (Required to use the Nexmo transport (^1.0).)
laravel/framework suggests installing pda/pheanstalk (Required to use the beanstalk queue driver (^4.0).)
laravel/framework suggests installing predis/predis (Required to use the redis cache and queue drivers (^1.0).)
laravel/framework suggests installing pusher/pusher-php-server (Required to use the Pusher broadcast driver (^3.0).)
laravel/framework suggests installing symfony/dom-crawler (Required to use most of the crawler integration testing tools (^4.2).)
laravel/framework suggests installing symfony/psr-http-message-bridge (Required to use PSR-7 bridging features (^1.1).)
laravel/framework suggests installing wildbit/swiftmailer-postmark (Required to use Postmark mail driver (^3.0).)
psy/psysh suggests installing ext-pcntl (Enabling the PCNTL extension makes PsySH a lot happier :))
psy/psysh suggests installing ext-pdo-sqlite (The doc command requires SQLite to work.)
psy/psysh suggests installing hoa/console (A pure PHP readline implementation. You'll want this if your PHP install doesn't already support readline or libedit.)
filp/whoops suggests installing whoops/soap (Formats errors as SOAP responses)
sebastian/global-state suggests installing ext-uopz (*)
phpunit/php-code-coverage suggests installing ext-xdebug (^2.6.0)
phpunit/phpunit suggests installing phpunit/php-invoker (^2.0)
phpunit/phpunit suggests installing ext-xdebug (*)
Writing lock file
Generating optimized autoload files
> Illuminate\Foundation\ComposerScripts::postAutoloadDump
> @php artisan package:discover --ansi
Discovered Package: beyondcode/laravel-dump-server
Discovered Package: fideloper/proxy
Discovered Package: laravel/tinker
Discovered Package: nesbot/carbon
Discovered Package: nunomaduro/collision
Package manifest generated successfully.
> @php artisan key:generate --ansi
Application key set successfully.
Using version ^2.1 for laravel-frontend-presets/tailwindcss
./composer.json has been updated
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 1 install, 0 updates, 0 removals
  - Installing laravel-frontend-presets/tailwindcss (2.1.0): Loading from cache
Writing lock file
Generating optimized autoload files
> Illuminate\Foundation\ComposerScripts::postAutoloadDump
> @php artisan package:discover --ansi
Discovered Package: beyondcode/laravel-dump-server
Discovered Package: fideloper/proxy
Discovered Package: laravel-frontend-presets/tailwindcss
Discovered Package: laravel/tinker
Discovered Package: nesbot/carbon
Discovered Package: nunomaduro/collision
Package manifest generated successfully.
➜ ✅  .env file configured to use git_test_output.
➜ ✅  Database created successfully.
Migration table created successfully.
Migrating: 2014_10_12_000000_create_users_table
Migrated:  2014_10_12_000000_create_users_table (0.03 seconds)
Migrating: 2014_10_12_100000_create_password_resets_table
Migrated:  2014_10_12_100000_create_password_resets_table (0.02 seconds)
Tailwind CSS scaffolding with auth views installed successfully.
Please run "npm install && npm run dev" to compile your fresh scaffolding.
➜ 🤖 Running NPM Install

> fsevents@1.2.9 install /Users/builder/Sites/git-test-output/node_modules/fsevents
> node install

node-pre-gyp WARN Using needle for node-pre-gyp https download 
[fsevents] Success: "/Users/builder/Sites/git-test-output/node_modules/fsevents/lib/binding/Release/node-v64-darwin-x64/fse.node" is installed via remote
npm notice created a lockfile as package-lock.json. You should commit this file.
added 1105 packages from 508 contributors and audited 17371 packages in 15.89s
found 0 vulnerabilities

> @ dev /Users/builder/Sites/git-test-output
> npm run development

> @ development /Users/builder/Sites/git-test-output
> cross-env NODE_ENV=development node_modules/webpack/bin/webpack.js --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js

        Additional dependencies must be installed. This will only take a moment.
 
        Running: npm install vue-template-compiler --save-dev --production=false
 
        Okay, done. The following packages have been installed and saved to your package.json dependencies list:
 
        - vue-template-compiler
 
98% after emitting SizeLimitsPlugin

 DONE  Compiled successfully in 3406ms                                                                                                                                 1:23:35 AM

       Asset     Size   Chunks             Chunk Names
/css/app.css  863 KiB  /js/app  [emitted]  /js/app
  /js/app.js  926 KiB  /js/app  [emitted]  /js/app
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ⚠️️.gitignore already exists.
➜ 🤖 Creating README.md...
➜ ⚠️️README.md already exists.
===================================================================================================
➜ 🤖 Initializing Local Repository...
Initialized empty Git repository in /Users/builder/Sites/git-test-output/.git/
===================================================================================================
➜ 🤖 Git Remote 📡 Connecting to git@github.com:bayareawebpro/git-test-output.git...
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 37 (delta 0), reused 0 (delta 0), pack-reused 33
Unpacking objects: 100% (37/37), done.
From github.com:bayareawebpro/git-test-output
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
➜ ✅  Git Remote is set to origin and syncronized: git@github.com:bayareawebpro/git-test-output.git.
➜ 🤖 Setting Remote Upstream to origin master...
Branch 'master' set up to track remote branch 'master' from 'origin'.
Everything up-to-date
➜ ✅  Git Remote Upstream is set to origin master and syncronized: git@github.com:bayareawebpro/git-test-output.git.
===================================================================================================
➜ 🤖 Saving... WIP
[master be21dc8] WIP
 99 files changed, 104922 insertions(+)
 create mode 100644 .editorconfig
 create mode 100644 .env.example
 create mode 100644 .gitattributes
 create mode 100644 .gitignore
 create mode 100644 .styleci.yml
 create mode 100644 app/Console/Kernel.php
 create mode 100644 app/Exceptions/Handler.php
 create mode 100644 app/Http/Controllers/Auth/ForgotPasswordController.php
 create mode 100644 app/Http/Controllers/Auth/LoginController.php
 create mode 100644 app/Http/Controllers/Auth/RegisterController.php
 create mode 100644 app/Http/Controllers/Auth/ResetPasswordController.php
 create mode 100644 app/Http/Controllers/Auth/VerificationController.php
 create mode 100644 app/Http/Controllers/Controller.php
 create mode 100644 app/Http/Controllers/HomeController.php
 create mode 100644 app/Http/Kernel.php
 create mode 100644 app/Http/Middleware/Authenticate.php
 create mode 100644 app/Http/Middleware/CheckForMaintenanceMode.php
 create mode 100644 app/Http/Middleware/EncryptCookies.php
 create mode 100644 app/Http/Middleware/RedirectIfAuthenticated.php
 create mode 100644 app/Http/Middleware/TrimStrings.php
 create mode 100644 app/Http/Middleware/TrustProxies.php
 create mode 100644 app/Http/Middleware/VerifyCsrfToken.php
 create mode 100644 app/Providers/AppServiceProvider.php
 create mode 100644 app/Providers/AuthServiceProvider.php
 create mode 100644 app/Providers/BroadcastServiceProvider.php
 create mode 100644 app/Providers/EventServiceProvider.php
 create mode 100644 app/Providers/RouteServiceProvider.php
 create mode 100644 app/User.php
 create mode 100755 artisan
 create mode 100644 bootstrap/app.php
 create mode 100644 bootstrap/cache/.gitignore
 create mode 100644 composer.json
 create mode 100644 composer.lock
 create mode 100644 config/app.php
 create mode 100644 config/auth.php
 create mode 100644 config/broadcasting.php
 create mode 100644 config/cache.php
 create mode 100644 config/database.php
 create mode 100644 config/filesystems.php
 create mode 100644 config/hashing.php
 create mode 100644 config/logging.php
 create mode 100644 config/mail.php
 create mode 100644 config/queue.php
 create mode 100644 config/services.php
 create mode 100644 config/session.php
 create mode 100644 config/view.php
 create mode 100644 database/.gitignore
 create mode 100644 database/factories/UserFactory.php
 create mode 100644 database/migrations/2014_10_12_000000_create_users_table.php
 create mode 100644 database/migrations/2014_10_12_100000_create_password_resets_table.php
 create mode 100644 database/seeds/DatabaseSeeder.php
 create mode 100644 package-lock.json
 create mode 100644 package.json
 create mode 100644 phpunit.xml
 create mode 100644 public/.htaccess
 create mode 100644 public/css/app.css
 create mode 100644 public/favicon.ico
 create mode 100644 public/index.php
 create mode 100644 public/js/app.js
 create mode 100644 public/mix-manifest.json
 create mode 100644 public/robots.txt
 create mode 100644 public/web.config
 create mode 100644 readme.md
 create mode 100644 resources/css/app.css
 create mode 100644 resources/js/app.js
 create mode 100644 resources/js/bootstrap.js
 create mode 100644 resources/js/components/ExampleComponent.vue
 create mode 100644 resources/lang/en/auth.php
 create mode 100644 resources/lang/en/pagination.php
 create mode 100644 resources/lang/en/passwords.php
 create mode 100644 resources/lang/en/validation.php
 create mode 100644 resources/views/auth/login.blade.php
 create mode 100644 resources/views/auth/passwords/email.blade.php
 create mode 100644 resources/views/auth/passwords/reset.blade.php
 create mode 100644 resources/views/auth/register.blade.php
 create mode 100644 resources/views/auth/verify.blade.php
 create mode 100644 resources/views/home.blade.php
 create mode 100644 resources/views/layouts/app.blade.php
 create mode 100644 resources/views/welcome.blade.php
 create mode 100644 routes/api.php
 create mode 100644 routes/channels.php
 create mode 100644 routes/console.php
 create mode 100644 routes/web.php
 create mode 100644 server.php
 create mode 100644 storage/app/.gitignore
 create mode 100644 storage/app/public/.gitignore
 create mode 100644 storage/framework/.gitignore
 create mode 100644 storage/framework/cache/.gitignore
 create mode 100644 storage/framework/cache/data/.gitignore
 create mode 100644 storage/framework/sessions/.gitignore
 create mode 100644 storage/framework/testing/.gitignore
 create mode 100644 storage/framework/views/.gitignore
 create mode 100644 storage/logs/.gitignore
 create mode 100644 tailwind.config.js
 create mode 100644 tests/CreatesApplication.php
 create mode 100644 tests/Feature/ExampleTest.php
 create mode 100644 tests/TestCase.php
 create mode 100644 tests/Unit/ExampleTest.php
 create mode 100644 webpack.mix.js
Enumerating objects: 132, done.
Counting objects: 100% (132/132), done.
Delta compression using up to 12 threads
Compressing objects: 100% (112/112), done.
Writing objects: 100% (131/131), 444.25 KiB | 4.23 MiB/s, done.
Total 131 (delta 14), reused 0 (delta 0)
remote: Resolving deltas: 100% (14/14), done.
To github.com:bayareawebpro/git-test-output.git
   bf32330..be21dc8  master -> master
➜ ✅  Local Pushed to Remote Successfully!
```