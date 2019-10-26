#!/usr/bin/env bash

logger:info "Reading Directory"
directory:list "$BASHER_PATH"

logger:info "Filtering Folders"
directory:folders "$BASHER_PATH"

logger:info "Filtering Files"
directory:files "$BASHER_PATH"

logger:info "Reading File to Line Array"
file:read "$BASHER_PATH/.env"
