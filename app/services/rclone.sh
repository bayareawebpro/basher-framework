#!/usr/bin/env bash
function rclone:install(){
  logger:info "Download RClone"
  logger:warning "Enter Your Password..."
  curl https://rclone.org/install.sh | sudo bash
  logger:success "RClone Installed"
  file:copy "$BASHER_PATH/resources/rclone.conf" "$HOME/.config/rclone/rclone.conf"
  logger:success "Created: $HOME/.config/rclone/rclone.conf"
  rclone config
}
function rclone:config(){
  file:read "$HOME/.config/rclone/rclone.conf"
}
function rclone:config:edit(){
  nano "$HOME/.config/rclone/rclone.conf"
}
function rclone:sync:cdn(){
  rclone sync --progress --ignore-existing --cache-rps 180 "$1":"$2" "$3"
   #>> "$4" 2>&1
}
function rclone:sync(){
  rclone sync --progress --exclude-from "$BASHER_PATH/resources/rclone-blacklist.conf" "$1":"$2" "$3"
 #>> "$4" 2>&1
}