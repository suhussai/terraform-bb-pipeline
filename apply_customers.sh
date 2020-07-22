#!/bin/bash

[ -s "$1" ] || exit 0
csv_file=updated_$1
sed 's/[^a-zA-Z0-9,\.]//g' "$1" > "$csv_file"

while IFS=, read -r col1 col2 col3 col4
do
    echo "$col1 | $col2 | $col3 | $col4"
    if [ -d "$col1" ]
    then
        cd "$col1" || exit
        terragrunt apply -auto-approve || exit 1
        cd ..
    fi
done < "$csv_file"

rm "$csv_file"

