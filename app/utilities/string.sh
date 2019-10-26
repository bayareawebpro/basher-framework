#!/usr/bin/env bash
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