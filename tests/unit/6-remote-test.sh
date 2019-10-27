#!/usr/bin/env bash

SCRIPT="https://raw.githubusercontent.com/bayareawebpro/basher-framework/master/tests/mocks/remote-mock.sh"
remote:require "$SCRIPT" myVar
assert:truthy "remote:require"
