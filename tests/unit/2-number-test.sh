#!/usr/bin/env bash

num:is:equal 1 1
assert:truthy "num:is:equal"

num:not:equal 1 2
assert:truthy "num:not:equal"

num:less:than 0 1
assert:truthy "num:less:than"

num:greater:than 3 2
assert:truthy "num:greater:than"

num:less:or:equal 1 2
assert:truthy "num:less:or:equal"

num:greater:or:equal 3 2
assert:truthy "num:greater:or:equal"