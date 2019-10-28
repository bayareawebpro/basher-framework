#!/usr/bin/env bash
#source "$BASHER_PATH/tests/setup.sh"

if str:filled "$BASHER_CI"; then
  logger:warning "Skipping, no crontab available..."
  continue
fi

MOCKED="* * * * * /usr/bin/env bash $BASHER_PATH/tests/mocks/cron-mock.sh > $BASHER_PATH/tests/mocks/cron-mock.sh.log"

#cron:uninstall "$MOCKED"

cron:list
assert:truthy "cron:list"

if cron:has "$MOCKED"; then
  logger:failed "cron:has"
else
  logger:success "cron:has"
fi

cron:install "$MOCKED"
assert:truthy "cron:installed"

cron:list
if cron:has "$MOCKED"; then
  logger:success "cron:has installed"
else
  logger:failed "cron:has installed"
fi

cron:uninstall "$MOCKED"
assert:truthy "cron:uninstalled"
cron:list

if cron:has "$MOCKED"; then
  logger:failed "cron:has"
else
  logger:success "cron:has"
fi