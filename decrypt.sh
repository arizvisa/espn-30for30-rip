#!/bin/sh
prefix=$1

echo -n >| "decrypted/$prefix.txt"
for lst in "work/$prefix.lists"/*.lst; do
    iv=`./get-iv.sh "$lst"`
    key=`./get-key.sh "$prefix.asset_7000k.aes-128-cbc.bin"`
    if [ -z "$iv" ] || [ -z "$key" ]; then
        echo unable to read iv or key 1>&2
        exit 1
    fi
    echo processing $prefix -- $lst
    grep -v '^#' "$lst" | grep -v '^$' | while read n; do
        echo ...$n
        if [ ! -e "encrypted/$prefix.$n" ]; then
            echo unable to read encrypted/$prefix.$n 1>&2
            exit 1
        fi
        mkdir -p decrypted/$prefix.`dirname "$n"`
        openssl enc -d -aes-128-cbc -K "$key" -iv "$iv" -in "encrypted/$prefix.$n" -out "decrypted/$prefix.$n"
        printf 'file %s\n' "$prefix.$n" >> "decrypted/$prefix.txt"
    done
done

echo wrote everything to decrypted/$prefix.txt
