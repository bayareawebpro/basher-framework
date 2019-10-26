#!/usr/bin/env bash
function collect:make(){
  collection=()
}
function collect:all(){
  echo "${collection[@]}"
}
function collect:count(){
  echo "${#collection[@]}"
}
function collect:push(){
  collection+=("$1")
}
function collect:set(){
  collection[$1]="$2"
}
function collect:keys(){
  echo "${!collection[@]}"
}
function collect:filter(){
  collection=(${collection[@]/$1*/})
  collect:all
}
function collect:range(){
  echo "${collection[@]:$1:$2}"
}

