#!/usr/bin/env bash
MOCKED="$BASHER_PATH/tests/mocks/process-mock.sh"
echo "" > "$MOCKED.log"
process:running "$MOCKED" && sleep 1
process:status "$MOCKED" && sleep 1
process:start "$MOCKED" && sleep 1
process:status "$MOCKED" && sleep 1
process:log "$MOCKED" && sleep 1
process:status "$MOCKED" && sleep 1
process:log "$MOCKED" && sleep 1
process:stop "$MOCKED" && sleep 1
process:status "$MOCKED"