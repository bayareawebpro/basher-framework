#!/usr/bin/env bash

# ====== Path Operations ================
function path:is:file(){
  [[ -f "$1" ]]
}
function path:is:directory(){
  [[ -d "$1" ]]
}
function path:filename(){
  echo "${1##*/}"
}
function path:extension(){
  echo "${1##*.}"
}
function path:base(){
  echo "${1%${1##*/}}"
}

# ====== Directory Operations ==============
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
function directory:previous(){
  cd - || return 1
}
function directory:remove(){
  rm -r "$1" || return 1
}
function directory:force:remove(){
  rm -rf "$1" || return 1
}
function directory:trim(){
  logger:divider && logger:info "Trimming Old Files..."
  if path:is:directory "$1"; then
    if str:empty "$3"; then
      logger:debug "$(find "$1" -maxdepth 1 -name "*.*" -mtime "+$2" -type f)"
      if ! logger:confirm "Delete Files?"; then
        return 1
      fi
    fi
    if find "$1" -maxdepth 1 -name "*.*" -mtime "+$2" -type f -delete; then
      logger:success "Old Files Trimmed Successfully."
    fi
  else
    logger:failed "Trimming Old Files Failed.  Directory $1 not found."
  fi
}
function make:archive(){
  zip -r "$1" "$2" || return 1
}

# ====== File Operations ================
function file:read(){
  while read -r line; do
    echo "$line"
  done < "$1"
}
function file:remove(){
  rm "$1" || return 1
}
function file:force:remove(){
  rm -f "$1" || return 1
}
function file:get(){
  cat "$1"
}
function file:put(){
  echo "$1" > "$2"
}
function file:append(){
  echo "$1" >> "$2"
}
function file:copy(){
  cp "$1" "$2"
}
function file:exists(){
  [[ -e "$1" ]]
}
function file:is:readable(){
  [[ -r "$1" ]]
}
function file:is:writable(){
  [[ -w "$1" ]]
}
function file:is:executable(){
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
function file:is:newer(){
  [[ "$1" -nt "$2" ]]
}
function file:is:older(){
  [[ "$1" -ot "$2" ]]
}
function file:equals(){
  [[ "$1" -ef "$2" ]]
}
