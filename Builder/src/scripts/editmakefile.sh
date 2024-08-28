#!/bin/sh

set -x

if [ "$#" -ne 2 ]; then
    echo "Script requires 1 argument to execute:"
    echo -e "\t-path to resource-agents Makefile"
    echo -e "\t-rpm version from pom"
    exit 1
else
    make_path=$1
    rpm_version=$2
fi

sed -i 's/^PACKAGE = resource-agents/PACKAGE = EXTRlitpresourceagents/' $make_path
sed -i 's/^PACKAGE_STRING = resource-agents UNKNOWN/PACKAGE_STRING = EXTRlitpresourceagents '${rpm_version}'/' $make_path
sed -i 's/^PACKAGE_TARNAME = resource-agents/PACKAGE_TARNAME = EXTRlitpresourceagents/' $make_path
sed -i 's/^PACKAGE_NAME = resource-agents/PACKAGE_NAME = EXTRlitpresourceagents/' $make_path
sed -i 's/^PACKAGE_VERSION = UNKNOWN/PACKAGE_VERSION = '${rpm_version}'/' $make_path
sed -i 's/^VERSION = UNKNOWN/VERSION = '${rpm_version}'/' $make_path


