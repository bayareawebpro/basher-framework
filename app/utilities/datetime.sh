#!/usr/bin/env bash

# Timestamp Formatted
function date:timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Filename Formatted
function date:filename() {
  date +"%Y-%m-%d_%H-%M-%S"
}

# Human Formatted
function date:humanized() {
  date +"%m/%d/%Y %I:%M%p"
}