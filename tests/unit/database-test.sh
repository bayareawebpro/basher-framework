#!/usr/bin/env bash
### TEST Database
if has:database "git_test_output"; then
  drop:database "git_test_output"
fi
make:database git-test-output
has:database "git_test_output" || logger:failed "Database Not Found."