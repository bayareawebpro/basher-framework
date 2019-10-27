#!/usr/bin/env bash
MOCKED="$BASHER_PATH/tests/mocks/cron-mock.sh"

cron:list
assert:truthy "cron:list"

if cron:has "$MOCKED"; then
  logger:failed "cron:has $(basename $MOCKED)"
else
  logger:success "cron:has $(basename $MOCKED)"
fi

cron:install "$MOCKED"
assert:truthy "cron:install $(basename $MOCKED)"

cron:list
if cron:has "$MOCKED"; then
  logger:success "cron:has $(basename $MOCKED)"
else
  logger:failed "cron:has $(basename $MOCKED)"
fi

cron:uninstall "$MOCKED"
assert:truthy "cron:uninstall $(basename $MOCKED)"
cron:list

if cron:has "$MOCKED"; then
  logger:failed "cron:has $(basename $MOCKED)"
else
  logger:success "cron:has $(basename $MOCKED)"
fi