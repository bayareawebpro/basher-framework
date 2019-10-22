#!/usr/bin/env bash

function git:setup()
{
  logger:divider
  logger:info "Initializing Local Repository..."
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    exit 1
  else
    git init
  fi
}