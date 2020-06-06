#!/bin/sh
list="$1"

listname=`basename "$list"`
name=`echo "$listname" | cut -d. -f1`

mkdir -p "work/$name.lists"
grep -v ^# "$list" | cut -d/ -f2 | sort | uniq | while read n; do
    grep -B2 /$n/ "$list" > "work/$name.lists/$n.lst"
done

echo wrote lists for each section under work/$name.lists
