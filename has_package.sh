#!/bin/bash
#
# has_package.sh: tests if a Java source code file is in a specified package
#
# Usage: has_package.sh java-file package-name

if [[ $# != 2 ]]; then
    echo "Usage: has_package.sh java-file package-name" >&2
    exit 1
fi

if [[ ! $2 =~ ^[a-z][A-Za-z0-9_\.]*$ ]]; then
    echo "$2 is not a conventional Java package name" >&2
    exit 2
fi

if grep -Eq "package $2;" $1; then
    echo "$1 is in package $2" >&2
    exit 0
else
    echo "package $2 not found in $1"
    exit 3
fi