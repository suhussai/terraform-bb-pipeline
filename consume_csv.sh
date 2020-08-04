#!/bin/bash
[ -s "$1" ] || exit 0
echo "" >> "$1"
csv_file=updated_$1
sed 's/[^a-zA-Z0-9,\.]//g' "$1" > "$csv_file"

while IFS=, read -r col1 col2 col3 col4
do
    echo "$col1 | $col2 | $col3 | $col4"
    if [ -d "$col1" ]
    then
        rm "$col1"/terragrunt.hcl
    else
        mkdir "$col1"
    fi
    cat >"$col1"/terragrunt.hcl <<EOL
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@bitbucket.org:corpinfo/terragrunt-multiview-infrastructure-modules.git?ref=$col4"
}

inputs = {
  client_name = "$col1"
  client_id  = "$col2"
  client_stack_name = "$col3"
}
EOL
done < "$csv_file"

rm "$csv_file"
