#!/usr/bin/env bash

collect:make

num:is:equal "$(collect:count)" 0
assert:truthy "collect:count 0"

collect:push "Apple"
collect:push "Banana"
collect:push "Orange"
num:is:equal "$(collect:count)" 3
assert:truthy "collect:pushed 3"

str:is:equal "$(collect:all)" "Apple Banana Orange"
assert:truthy "collect:all Apple Banana Orange"

collect:set 1 "Pizza"
str:is:equal "$(collect:all)" "Pizza Banana Orange"
assert:truthy "collect:set Pizza"

for item in $(collect:all); do
  echo "$item"
done

str:is:equal "$(collect:filter "Pizza")" "Banana Orange"
assert:truthy "collect:filter not has Pizza"

for item in $(collect:filter "Pizza"); do
  echo "$item"
done