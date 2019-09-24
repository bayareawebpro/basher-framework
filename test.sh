#!/bin/bash
TEST_DIR="$HOME/testing"
rm -rf "$TEST_DIR" || return
mkdir "$TEST_DIR" || return
cd "$TEST_DIR" || return