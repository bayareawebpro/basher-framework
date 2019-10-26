#!/usr/bin/env bash
function logger:confirm() {
  colors:yellowb "$(printf "%s\r""➜ ❔ $1 [y/n]")"
  local ANSWER
  read -r ANSWER
  [[ "$ANSWER" == "y" ]]
}

function logger:input() {
  colors:yellowb "$(printf "%s\r""➜ ❔ $1")"
  read -r "$2"
}

function logger:info() {
  colors:lightblue "$(printf "%s\r""➜ 🤖 $1")"
}

function logger:warning() {
  colors:yellow "$(printf "%s\r""➜ ❕ $1")"
}

function logger:error() {
  colors:red "$(printf "%s\r""➜ 🥵 $1")"
}

function logger:failed() {
  colors:red "$(printf "%s\r""➜ ❌  $1")"
}

function logger:denied() {
  colors:red "$(printf "%s\r""➜ 🚫 $1")"
}

function logger:alert() {
  colors:redb "$(printf "%s\r""➜ 🚨 $1")"
}

function logger:success() {
  colors:green "$(printf "%s\r""➜ ✅  $1")"
}

function logger:celebrate() {
  local compiled=$(printf "%s\r""➜ 🎉 $1")
  colors:white "$compiled"
}

function logger:debug() {
  local compiled=$(printf "%s\r""$1")
  colors:white "$compiled"
}

function logger:text() {
  local compiled=$(printf "%s\r""➜ $1")
  colors:whiteb "$compiled"
}

function logger:divider() {
  for ((i = 1 ; i <= (COLUMNS / 2); i++)); do
    printf "%s\r""$(jot -s "=" -b "=" $((i)))"
    sleep 0.0001
  done
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
  echo -e "${black}${1}${end}"
}

function colors:blackb() {
  echo -e "${blackb}${1}${end}"
}

function colors:white() {
  echo -e "${white}${1}${end}"
}

function colors:whiteb() {
  echo -e "${whiteb}${1}${end}"
}

function colors:red() {
  echo -e "${red}${1}${end}"
}

function colors:redb() {
  echo -e "${redb}${1}${end}"
}

function colors:green() {
  echo -e "${green}${1}${end}"
}

function colors:greenb() {
  echo -e "${greenb}${1}${end}"
}

function colors:yellow() {
  echo -e "${yellow}${1}${end}"
}

function colors:yellowb() {
  echo -e "${yellowb}${1}${end}"
}

function colors:blue() {
  echo -e "${blue}${1}${end}"
}

function colors:blueb() {
  echo -e "${blueb}${1}${end}"
}

function colors:purple() {
  echo -e "${purple}${1}${end}"
}

function colors:purpleb() {
  echo -e "${purpleb}${1}${end}"
}

function colors:lightblue() {
  echo -e "${lightblue}${1}${end}"
}

function colors:lightblueb() {
  echo -e "${lightblueb}${1}${end}"

}
