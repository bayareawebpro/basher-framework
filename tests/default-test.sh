#!/usr/bin/env zsh
# shellcheck source=$BASHER_PATH/tests/setup.sh
source "$BASHER_PATH/tests/setup.sh"

#(string:is:empty "" && logger:success "string:is:empty") || logger:failed  "string:is:empty"
#(string:not:empty "not empty" && logger:success "string:not:empty") || logger:failed "string:not:empty"
#(string:is:equal "my-string" "my-string" && logger:success "string:is:equal") || logger:failed  "string:is:equal"
#(string:not:equal "my-string" "other-string" && logger:success "string:not:equal") || logger:failed "string:not:equal"
#(string:matches:regex "123" '^[0-9]+$' && logger:success "string:matches:regex true") || logger:failed  "string:matches:regex true"
#(string:matches:regex "asd" '^[0-9]+$' || logger:success "string:matches:regex false") || logger:failed "string:matches:regex false"

#(num:is:equal 1 1 && logger:success "num:is:equal") || logger:failed "num:is:equal"
#(num:not:equal 1 2 && logger:success "num:not:equal") || logger:failed "num:not:equal"
#(num:less:than 0 1 && logger:success "num:less:than") || logger:failed "num:less:than"
#(num:greater:than 3 2 && logger:success "num:greater:than") || logger:failed "num:greater:than"
#(num:less:than:or:equal 1 2 && logger:success "num:less:than:or:equal") || logger:failed "num:less:than:or:equal"
#(num:greater:than:or:equal 3 2 && logger:success "num:greater:than:or:equal") || logger:failed "num:greater:than:or:equal"

#logger:info "Hello."
#if logger:confirm "Testing App... Are you sure?"; then
#  logger:success "Completed."
#else
#  logger:failed "Aborted."
#fi

#logger:input "Project Name?" "ANSWER"
#logger:success "$ANSWER.";

#make:laravel "git-test-output"
#git:ignore
#git:readme
#echo "Master v1.0" >> "$TEST_DIR/README.md"
#git:setup
#git:connect
#git:save
#artisan serve
#chrome:serve

### TEST Branching
#git:branch gh-pages fresh
#echo "Docs v1.0" >> "$TEST_DIR/README.md"
#git:save

#git:branch dev
#echo "Dev v1.0" >> "$TEST_DIR/README.md"
#git:save

#git:switch master
#git:branch:delete dev
#git:branch:delete gh-pages

### TEST Database
#if has:database "git_test_output"; then
#  drop:database "git_test_output"
#fi
#make:database git-test-output
#has:database "git_test_output" || logger:failed "Database Not Found."