#!/bin/sh

set -x

if [ "$#" -ne 2 ]; then
    echo "Script requires 1 argument to execute:"
    echo -e "\t-path to resource-agents Makefile"
    echo -e "\t-rpm version from pom"
    exit 1
else
    spec_in_path=$1
    rpm_version=$2
fi

release=$( echo "$rpm_version" | cut -d'.' -f1 )

sed -i 's/^Release:.*/Release:        '${release}'/' $spec_in_path

