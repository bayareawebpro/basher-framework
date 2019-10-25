#!/usr/bin/env bash
# shellcheck source="$BASHER_PATH/bootstrap/tests.sh"
source "$BASHER_PATH/bootstrap/tests.sh"

### TEST Database
#if has:database "git_test_output"; then
#  drop:database "git_test_output"
#fi
#make:database git-test-output
#has:database "git_test_output" || logger:failed "Database Not Found."