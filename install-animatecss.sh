#!/bin/bash
install:animatecss() {
  if npm install animate.css; then
    {
      echo "@import '~animate.css/source/_base.css';"
      echo "@import '~animate.css/source/fading_entrances/fadeInUp.css';"
    } >>"$PWD/resource/css/animate.sass"

    echo "@import 'animate.sass';" >> "$PWD/resource/css/app.sass"
    logger:success "animate.css installed."
  else
    logger:failed "Failed to install animate.css."
  fi
}