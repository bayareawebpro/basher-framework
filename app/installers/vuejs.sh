#!/bin/bash
function install:vuejs(){
    logger:divider && logger:info "Intalling Vue.js"
    if file:exists package.json; then
      logger:info "Using NPM..."
      npm install vue
      logger:success "Installed Vue.js Successfully"
    else
      logger:failed "Failed to install Vue.js"
    fi
}