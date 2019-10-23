#!/usr/bin/env bash
function path:is:file(){
  [[ -f "$1" ]]
}
function path:is:directory(){
  [[ -d "$1" ]]
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
  [[ "$1" -ef  "$2" ]]
}
function file:copy(){
  cp "$1" "$2"
}
function directory:make(){
  mkdir "$1" || return 1;
}
function directory:change(){
  cd "$1" || return 1;
}
