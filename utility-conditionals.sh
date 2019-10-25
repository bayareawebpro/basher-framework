#!/usr/bin/env bash
function func:exists() {
    declare -f -F "$1" > /dev/null
    return $?
}
function process:is:running() {
  [[ -n "$(ps -p "$(cat "$1")" -o pid=)" ]]
}
function string:is:empty(){
  [[ -z "$1" ]]
}
function string:is:numeric(){
  [[ $1 =~ ^[0-9]+$ ]]
}
function string:not:empty(){
  [[ -n "$1" ]]
}
function string:is:equal(){
  [[ "$1" == "$2" ]]
}
function string:not:equal(){
  [[ "$1" != "$2" ]]
}
function string:matches:regex(){
  [[ $1 =~ $2 ]];
}
function num:is:equal(){
  [[ $1 -eq $2 ]]
}
function num:not:equal(){
  [[ $1 -ne $2 ]]
}
function num:less:than(){
  [[ $1 -lt $2 ]]
}
function num:less:than:or:equal(){
  [[ $1 -le $2 ]]
}
function num:greater:than(){
  [[ $1 -gt $2 ]]
}
function num:greater:than:or:equal(){
  [[ $1 -ge $2 ]]
}
