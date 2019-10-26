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
