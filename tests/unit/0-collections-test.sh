#!/usr/bin/env bash
collect:make
collect:count
collect:push "Apple"
collect:push "Banana"
collect:push "Orange"
collect:all
collect:set 1 "Pizza"
collect:all
collect:filter "Pizza"
for val in $(collect:all); do
  echo "Collection Has $val"
done
