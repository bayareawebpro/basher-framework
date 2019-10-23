#!/usr/bin/env bash
string:is:empty(){
  [[ -z "$1" ]]
}
string:is:numeric(){
  [[ $1 =~ ^[0-9]+$ ]]
}
string:not:empty(){
  [[ -n "$1" ]]
}
string:is:equal(){
  [[ "$1" == "$2" ]]
}
string:not:equal(){
  [[ "$1" != "$2" ]]
}
string:matches:regex(){
  [[ $1 =~ $2 ]];
}
num:is:equal(){
  [[ $1 -eq $2 ]]
}
num:not:equal(){
  [[ $1 -ne $2 ]]
}
num:less:than(){
  [[ $1 -lt $2 ]]
}
num:less:than:or:equal(){
  [[ $1 -le $2 ]]
}
num:greater:than(){
  [[ $1 -gt $2 ]]
}
num:greater:than:or:equal(){
  [[ $1 -ge $2 ]]
}
