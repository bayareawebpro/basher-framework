#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/bootstrap/tests.sh"
source "$BASHER_PATH/bootstrap/tests.sh"

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