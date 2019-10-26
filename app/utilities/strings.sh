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