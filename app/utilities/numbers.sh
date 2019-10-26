#!/usr/bin/env bash
function num:is:equal(){
  [[ $1 -eq $2 ]]
}
function num:not:equal(){
  [[ $1 -ne $2 ]]
}
function num:less:than(){
  [[ $1 -lt $2 ]]
}
function num:less:or:equal(){
  [[ $1 -le $2 ]]
}
function num:greater:than(){
  [[ $1 -gt $2 ]]
}
function num:greater:or:equal(){
  [[ $1 -ge $2 ]]
}