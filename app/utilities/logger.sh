#!/usr/bin/env bash
function logger:confirm() {
  colors:yellowb "➜ ❔ $1 [y/n]"
  local ANSWER
  read -r ANSWER
  [[ "$ANSWER" == "y" ]]
}
function logger:input() {
  colors:yellowb "➜ ❔ $1"
  read -r "$2"
}
function logger:info() {
  colors:lightblueb "➜ 🤖 $1"
}
function logger:warning() {
  colors:yellowb "➜ ❕ $1"
}
function logger:error() {
  colors:redb "➜ 🥵 $1"
}
function logger:failed() {
  colors:redb "➜ ❌  $1"
}
function logger:denied() {
  colors:redb "➜ 🚫 $1"
}
function logger:alert() {
  colors:redb "➜ 🚨 $1"
}
function logger:success() {
  colors:greenb "➜ ✅  $1"
}
function logger:celebrate() {
  colors:whiteb "➜ 🎉 $1"
}
function logger:debug() {
  colors:white "➜ $1\r"
}
function logger:divider() {
  if test -t 1; then
    local COLUMNS=$(tput cols)
    for ((i = 1 ; i <= (COLUMNS / 2); i++)); do
      printf "%s\r""$(jot -s "=" -b "=" $((i)))"
      sleep 0.00001
    done
  fi
  logger:blank
}
function logger:blank() {
  printf "\n"
}

# Colors
end="\033[0m"
black="\033[0;30m"
blackb="\033[1;30m"
white="\033[0;37m"
whiteb="\033[1;37m"
red="\033[0;31m"
redb="\033[1;31m"
green="\033[0;32m"
greenb="\033[1;32m"
yellow="\033[0;33m"
yellowb="\033[1;33m"
blue="\033[0;34m"
blueb="\033[1;34m"
purple="\033[0;35m"
purpleb="\033[1;35m"
lightblue="\033[0;36m"
lightblueb="\033[1;36m"

function colors:show() {
  black "black"
  blackb "blackb"
  white "white"
  whiteb "whiteb"
  red "red"
  redb "redb"
  green "green"
  greenb "greenb"
  yellow "yellow"
  yellowb "yellowb"
  blue "blue"
  blueb "blueb"
  purple "purple"
  purpleb "purpleb"
  lightblue "lightblue"
  lightblueb "lightblueb"
}

function colors:black() {
  if test -t 1; then
    echo -e "${black}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:blackb() {
  if test -t 1; then
    echo -e "${blackb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:white() {
  if test -t 1; then
    echo -e "${white}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:whiteb() {
  if test -t 1; then
    echo -e "${whiteb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:red() {
  if test -t 1; then
    echo -e "${red}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:redb() {
  if test -t 1; then
    echo -e "${redb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:green() {
  if test -t 1; then
    echo -e "${green}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:greenb() {
  if test -t 1; then
    echo -e "${greenb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:yellow() {
  if test -t 1; then
    echo -e "${yellow}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:yellowb() {
  if test -t 1; then
    echo -e "${yellowb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:blue() {
  if test -t 1; then
    echo -e "${blue}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:blueb() {
  if test -t 1; then
    echo -e "${blueb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:purple() {
  if test -t 1; then
    echo -e "${purple}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:purpleb() {
  if test -t 1; then
    echo -e "${purpleb}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:lightblue() {
  if test -t 1; then
    echo -e "${lightblue}${1}${end}"
  else
    echo "$1"
  fi
}

function colors:lightblueb() {
  if test -t 1; then
    echo -e "${lightblueb}${1}${end}"
  else
    echo "$1"
  fi
}
