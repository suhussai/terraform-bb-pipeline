#!/bin/bash

# https://github.com/koalaman/shellcheck

# Find all files with shell extension
# shellcheck disable=SC2207
SHELL_SCRIPTS=($(find . ! -path "./.git/*" -name "*.sh" ))

# run shellcheck on all of them
FAILED=0
for file in "${SHELL_SCRIPTS[@]}"
do
  shellcheck "$file"
  status=$?
  if [[ "$status" != 0 ]]; then
    FAILED=1
  fi
done

exit $FAILED
