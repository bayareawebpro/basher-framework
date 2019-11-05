#!/usr/bin/env bash
function rclone:install(){
  logger:info "Download RClone"
  logger:warning "Enter Your Password..."
  curl https://rclone.org/install.sh | sudo bash
  logger:success "RClone Installed"
  file:copy "$BASHER_PATH/resources/rclone/rclone.conf" "$HOME/.config/rclone/rclone.conf"
  logger:success "Created: $HOME/.config/rclone/rclone.conf"
  /usr/local/bin/rclone config
}
function rclone:edit(){
  file:read "$HOME/.config/rclone/rclone.conf"
}
function rclone:config(){
  /usr/local/bin/rclone config
}
function rclone:config:edit(){
  nano "$HOME/.config/rclone/rclone.conf"
}
function rclone:sync:cdn(){
  /usr/local/bin/rclone sync -v --ignore-existing --cache-rps 180 "$1":"$2" "$3" > "$4" 2>&1
}
function rclone:sync(){
  /usr/local/bin/rclone sync -v --exclude-from "$BASHER_PATH/resources/rclone/rclone-blacklist.conf" "$1":"$2" "$3" > "$4" 2>&1
}