#!/bin/bash
function install:vuejs(){
    logger:divider && logger:info "Intalling Vue.js..."
    if file:exists package.json && npm install vue; then
      logger:success "Vue.js Installed Successfully."
    else
      logger:failed "Vue.js Failed to Install."
      logger:debug "Is there a package.json file for your project?"
    fi
}