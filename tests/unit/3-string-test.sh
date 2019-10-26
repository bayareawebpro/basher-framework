#!/usr/bin/env bash

str:empty "";
assert:truthy "str:empty"

str:filled "filled"
assert:truthy "str:filled"

str:is:equal "a" "a"
assert:truthy "str:is:equal"

str:not:equal "a" "b"
assert:truthy "str:not:equal"

str:matches:regex "123" "^[0-9]+$"
assert:truthy "str:matches:regex"

str:matches:regex "asd" "^[0-9]+$"
assert:falsy "str:matches:regex"

str:is:equal "$(str:length "abc")" "3"
assert:truthy "str:length"

str:is:equal "$(str:slice "Artisan" 0 3)" "Art"
assert:truthy "str:slice"

str:is:equal "$(str:replace:first "text text" "text" "new")" "new text"
assert:truthy "str:replace:first"

str:is:equal "$(str:replace:all "text text" "text" "new")" "new new"
assert:truthy "str:replace:all"

str:is:equal "$(str:prefix "text-file.txt" "text-")" "file.txt"
assert:truthy "str:prefix"

str:is:equal "$(str:suffix "text-file.txt" ".txt")" "text-file"
assert:truthy "str:suffix"