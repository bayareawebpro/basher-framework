#!/usr/bin/env bash

# ==== Publish Resource ====
function app:publish() {
  if path:is:file "$2"; then
    logger:info "$2 already exists."
  elif file:exists "$BASHER_PATH/$1" && file:copy "$BASHER_PATH/$1" "$2"; then
    logger:success "Published $BASHER_PATH/$1 => $2 completed."
  else
    logger:failed "Publishing $BASHER_PATH/$1 => $2 failed."
    return 1
  fi
}