#!/usr/bin/env bash

function slack:success(){
  slack:notify "$1" "$2" "good"
}
function slack:warning(){
  slack:notify "$1" "$2" "warning"
}

function slack:failed(){
  slack:notify "$1" "$2" "danger"
}

function slack:notify(){
  local COLOR="#0066CC"

  if str:empty "$SLACK_URL"; then
    logger:error "SLACK_URL not defined."
    return 1
  fi

  if str:filled "$1"; then
    local CHANNEL="$1"
  else
    logger:input "Enter CHANNEL:" "CHANNEL"
  fi

  if str:filled "$2"; then
    local MESSAGE="$2"
  else
    logger:input "Enter MESSAGE:" "MESSAGE"
  fi

  if str:filled "$3"; then
    COLOR="$3"
  fi

  # Build JSON payload
  local JSON="{
  \"channel\": \"$CHANNEL\",
  \"username\":\"Basher\",
  \"icon_emoji\":\":robot_face:\",
  \"attachments\":[
    {\"color\":\"$COLOR\",\"text\": \"$(echo "$MESSAGE" | sed 's/"/\"/g' | sed "s/'/\'/g")\"}
    ]
  }"

  # Fire Curl Command.
  local RESPONSE="$(curl --silent -H 'Content-Type:application/json; charset=utf-8' --data "$JSON" "$SLACK_URL")"

  # Validate the Response
  if [[ $RESPONSE == 'ok' ]]; then
    logger:success "Slack message sent."
  else
    logger:failed "Slack failed to be sent."
  fi
}