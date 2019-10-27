#!/usr/bin/env bash

cd "$BASHER_PATH/tests/mocks/filesystem" || (echo "Failed to Change Directory" && return 1);
rm -rf "$BASHER_PATH/tests/mocks/filesystem/test-dir"

logger:warning "Working Directory $PWD"

str:is:equal "$PWD/" "$(path:base "$PWD/file.txt")"
assert:truthy "path:base"

str:is:equal "txt" "$(path:extension "$PWD/file.txt")"
assert:truthy "path:extension"

str:is:equal "file.txt" "$(path:filename "$PWD/file.txt")"
assert:truthy "path:filename"

directory:make "test-dir"
assert:truthy "directory:make test-dir"

directory:list "$PWD"
assert:truthy "directory:list"

path:is:directory "$PWD/test-dir"
assert:truthy "path:is:directory test-dir"

directory:change "test-dir"
assert:truthy "directory:change test-dir"

str:is:equal "$PWD" "$BASHER_PATH/tests/mocks/filesystem/test-dir"
assert:truthy "$PWD"

path:is:file "$PWD/file.txt"
assert:falsy "path:is:file file.txt"

file:put "test" "$PWD/file.txt"
assert:truthy "file:put file.txt"

directory:list "$PWD"
assert:truthy "directory:list"

file:not:empty "$PWD/file.txt"
assert:truthy "file:not:empty file.txt"

path:is:file "$PWD/file.txt"
assert:truthy "path:is:file file.txt"

file:is:readable "$PWD/file.txt"
assert:truthy "file:is:readable file.txt"

file:is:symlink "$PWD/file.txt"
assert:falsy "file:is:symlink file.txt"

file:is:writable "$PWD/file.txt"
assert:truthy "file:is:writable file.txt"

file:is:executable "$PWD/file.txt"
assert:falsy "file:is:executable file.txt"

file:make:executable "$PWD/file.txt"
assert:truthy "file:make:executable file.txt"

file:is:executable "$PWD/file.txt"
assert:truthy "file:is:executable file.txt"

str:is:equal "test" "$(file:get "$PWD/file.txt")"
assert:truthy "file:get file.txt equals test"

file:copy "$PWD/file.txt" "$PWD/file2.txt" && file:exists "$PWD/file2.txt"
assert:truthy "file:copy && file:exists"

file:is:newer "$PWD/file2.txt" "$PWD/file.txt"
assert:truthy "file:is:newer"

file:is:older "$PWD/file.txt" "$PWD/file2.txt"
assert:truthy "file:is:older"

file:equals "$PWD/file.txt" "$PWD/file2.txt"
assert:falsy "file:equals"

file:append "test2" "$PWD/file2.txt"
assert:truthy "file:append"

str:is:equal "$(file:get "$PWD/file2.txt")" $'test\ntest2'
assert:truthy "file:append file:get"

file:read "$PWD/file2.txt"
assert:truthy "file:read"

directory:previous
assert:truthy "directory:previous"

str:is:equal "$PWD" "$BASHER_PATH/tests/mocks/filesystem"
assert:truthy "PWD mocks/filesystem"

directory:remove "$BASHER_PATH/tests/mocks/filesystem/test-dir"
assert:truthy "directory:remove"

directory:change "$BASHER_PATH"

logger:info "Reading App Directory"
directory:list "$BASHER_PATH"
assert:truthy "directory:list"

logger:info "Filtering Folders"
directory:folders "$BASHER_PATH"
assert:truthy "directory:folders"

logger:info "Filtering Files"
directory:files "$BASHER_PATH"
assert:truthy "directory:files"

logger:info "Reading File to Line Array"
file:read "$BASHER_PATH/.env"
assert:truthy "file:read"
