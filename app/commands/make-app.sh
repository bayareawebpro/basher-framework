#!/usr/bin/env bash
function app:build(){
directory:make ~/Desktop/Basher.app
directory:make ~/Desktop/Basher.app/Contents
directory:make ~/Desktop/Basher.app/Contents/MacOS
app:publish "bootstrap/basher" ~/Desktop/Basher.app/Contents/MacOS/basher
file:make:executable ~/Desktop/Basher.app/Contents/MacOS/basher
cp -rf "$BASHER_PATH" ~/Desktop/Basher.app/Contents/MacOS
}