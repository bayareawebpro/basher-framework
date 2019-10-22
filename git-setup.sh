#!/usr/bin/env bash

function git:setup()
{
  logger:divider
  logger:info "Initializing Local Repository..."
  git:ignore
  git:readme
  if [ -d ".git" ]; then
    echo "This directory has already been initialized with git."
    exit 1
  else
    git init &&
    git:initial
  fi
}