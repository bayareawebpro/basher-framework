#!/usr/bin/env bash
MOCKED="$BASHER_PATH/tests/mocks/process-mock.sh"
echo "" > "$MOCKED.log"

process:running "$MOCKED"
assert:falsy "process:running"
sleep 1

process:status "$MOCKED"
assert:falsy "process:status"
sleep 1

process:start "$MOCKED"
assert:truthy "process:start"
sleep 1

process:status "$MOCKED"
assert:truthy "process:status"
sleep 1

process:log "$MOCKED"
assert:truthy "process:log"
sleep 1

process:status "$MOCKED"
assert:truthy "process:status"
sleep 1

process:log "$MOCKED"
assert:truthy "process:log"
sleep 1

process:stop "$MOCKED"
assert:truthy "process:stop"
sleep 1

process:status "$MOCKED"
assert:falsy "process:status"