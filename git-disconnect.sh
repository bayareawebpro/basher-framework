#!/usr/bin/env bash
# Rmove All Connections
function git:disconnect()
{
  echo "===Disconnecting From Remote Repository==="
  git remote rm origin
}