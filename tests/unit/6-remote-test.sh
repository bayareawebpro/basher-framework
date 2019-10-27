#!/usr/bin/env bash
SCRIPT="https://raw.githubusercontent.com/bayareawebpro/basher-framework/master/tests/mocks/remote-mock.sh"

remote:ping "https://raw.githubusercontent.com"
assert:truthy "remote:ping"

remote:require "$SCRIPT" myVar
assert:truthy "remote:require"