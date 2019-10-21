#!/bin/bash
function git:sync() {
  echo "===Synchronizing Remote Repository==="
  if [ -z "$1" ]; then
    MESSAGE="WIP"
  else
    MESSAGE="$1"
  fi
  if (git add . && git commit -m "${MESSAGE}"); then
    echo "Saving... ${MESSAGE}"
    git push && echo "Local Pushed to Remote Successfully!"
  else
    git pull && echo "Remote Pulled to Local Successfully!"
  fi
}