#!/usr/bin/env bash
function directory:list() {
  for ENTRY in "$1"/*; do
    echo "$ENTRY";
  done
}
function directory:files() {
  for ENTRY in "$1"/*; do
    if path:is:file "$ENTRY"; then
      echo "$ENTRY";
    fi
  done
}
function directory:folders() {
  for ENTRY in "$1"/*; do
    if path:is:directory "$ENTRY"; then
      echo "$ENTRY";
    fi
  done
}
function directory:make(){
  mkdir "$1" || return 1
}
function directory:change(){
  cd "$1" || return 1
}
function directory:remove(){
  rm -r "$1" || return 1
}

function path:is:file(){
  [[ -f "$1" ]]
}
function path:is:directory(){
  [[ -d "$1" ]]
}
function file:read(){
  while read -r line; do
    echo "$line"
  done < "$1"
}
function file:copy(){
  cp "$1" "$2" || return 1
}
function file:exists(){
  [[ -e "$1" ]]
}
function file:readable(){
  [[ -r "$1" ]]
}
function file:writable(){
  [[ -w "$1" ]]
}
function file:executable(){
  [[ -x "$1" ]]
}
function file:make:executable(){
  chmod u+x "$1" || return 1
}
function file:is:symlink(){
  [[ -h "$1" ]]
}
function file:not:empty(){
  [[ -s "$1" ]]
}
function file:newer:than(){
  [[ "$1" -nt "$2" ]]
}
function file:older:than(){
  [[ "$1" -ot "$2" ]]
}
function file:equal:to(){
  [[ "$1" -ef "$2" ]]
}
