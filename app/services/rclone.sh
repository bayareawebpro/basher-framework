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
  rclone sync --ignore-existing --cache-rps 180 "$1":"$2" "$3" >> "$4" 2>&1
  open -a Console "$LOG"
}
function rclone:sync(){
  rclone sync --progress --exclude-from "$BASHER_PATH/resources/rclone-blacklist.conf" "$1":"$2" "$3" >> "$4" 2>&1
  open -a Console "$LOG"
}

# Database Snapshot Dumps
function backup:a1auto(){
  open -a Console
  local SOURCE=/home/forge/snapshots
  local CONNECTION=a1auto-sfprimary
  local DESTINATION=~/Backups/a1autotransport.com/snapshots
  local LOG=~/Backups/a1autotransport.com/logs/snapshots-$(date:filename).log
  rclone:sync $CONNECTION $SOURCE $DESTINATION "$LOG"
}

# Database Snapshot Dumps
function backup:bawp(){
  local SOURCE=/home/forge
  local CONNECTION=bawp-sfprimary
  local DESTINATION=~/Backups/bawp-sfprimary
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
