# Display OS Notification
function os:notify(){
  osascript -e 'display notification "'"$2"'" with title "'"$1"'" sound name "Submarine"'
}
function os:confirm(){
  local RESULT=$(osascript -e 'display alert "'"$1"'" message "'"$2"'" buttons {"Cancel", "OK"}')
  str:replace:first "$RESULT" "button returned:" ""
}
function os:speak(){
  osascript -e 'say "'"$1"'"'
}