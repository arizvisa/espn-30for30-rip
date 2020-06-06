#!/bin/sh
grep 'EXT-X-KEY:' "$1" | cut -d, -f3 | sed "s/^IV=0x//" | tr '[A-Z]' '[a-z]'
