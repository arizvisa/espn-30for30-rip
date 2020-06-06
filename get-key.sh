#!/bin/sh
od -An -t x1 "$1" | tr -d " "
