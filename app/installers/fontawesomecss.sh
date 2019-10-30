#!/bin/bash
install:fontawesomecss() {
  if npm install @fortawesome/fontawesome-free; then
    {
      echo "@import '~@fortawesome/fontawesome-free/scss/solid';"
      echo "@import '~@fortawesome/fontawesome-free/scss/brands';"
      echo "@import '~@fortawesome/fontawesome-free/scss/regular';"
      echo "@import '~@fortawesome/fontawesome-free/scss/fontawesome';"
    } >"$PWD/resources/css/icons.scss"
    logger:success "fontawesome.css installed."
  else
    logger:failed "Failed to install fontawesome.css."
  fi
}

