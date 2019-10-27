#!/usr/bin/env bash
function rclone:install(){
  logger:info "Download RClone"
  logger:warning "Enter Your Password..."
  curl https://rclone.org/install.sh | sudo bash
  logger:success "RClone Installed"
  rclone config
}
function rclone:sync:cdn(){
  rclone sync --ignore-existing --cache-rps 180 "$1":"$2" "$3" >> "$(date:filename).log" 2>&1
}
function rclone:sync(){
  rclone sync -v "$1":"$2" "$3" >> "$4" 2>&1
}

# Database Snapshot Dumps
function backup:a1auto(){
  local SOURCE=/home/forge/snapshots
  local CONNECTION=a1auto-sfprimary
  local DESTINATION=~/Backups/a1autotransport.com/snapshots/new
  local LOG=~/Backups/a1autotransport.com/logs/snapshots-$(date:filename).log
  rclone:sync $CONNECTION $SOURCE $DESTINATION "$LOG"
}

# CDN Storage
function backup:a1auto:cdn(){
  local SOURCE=a1auto
  local CONNECTION=a1auto-spaces
  local DESTINATION=~/Backups/a1autotransport.com/spaces
  local LOG=~/Backups/a1autotransport.com/logs/cdn-$(date:filename).log
  rclone:sync $CONNECTION $SOURCE $DESTINATION "$LOG"
}
