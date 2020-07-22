#!/bin/bash

# script to initialize all dirs excluding 
# the parent and terragrunt cache dirs
find . -not -path '*/.terragrunt-cache/*' -type f -name terragrunt.hcl -execdir terragrunt init \;
