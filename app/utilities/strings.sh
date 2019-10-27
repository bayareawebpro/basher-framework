#!/usr/bin/env bash

function str:empty(){
  [[ -z "$1" ]]
}
function str:is:numeric(){
  [[ $1 =~ ^[0-9]+$ ]]
}
function str:filled(){
  [[ -n "$1" ]]
}
function str:is:equal(){
  [[ "$1" == "$2" ]]
}
function str:not:equal(){
  [[ "$1" != "$2" ]]
}
function str:matches:regex(){
  [[ $1 =~ $2 ]];
}
function str:replace:first(){
  echo "${1/$2/$3}"
}
function str:replace:all(){
  echo "${1//$2/$3}"
}
function str:slice(){
  echo "${1:$2:$3}"
}
function str:suffix(){
  echo "${1%$2}"
}
function str:prefix(){
  echo "${1#$2}"
}
function str:length(){
  echo "${#1}"
}
function str:upper(){
  echo "$1" | tr "[:lower:]" "[:upper:]"
}
function str:lower(){
  echo "$1" | tr "[:upper:]" "[:lower:]"
}