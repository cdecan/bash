#!/bin/bash
#
# compile.sh: fake compilation of a Java source code file
#
# Usage: compile.sh java-filename

if [[ $# != 1 ]]; then
    echo "Usage: compile.sh java-filename" >&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "$1 does not exist" >&2
    exit 1
fi

if $(./fake_javac.sh $1); then
    echo "$1 compiled succesfully"
    exit 0
else
    echo "$1 did not compile" >&2
    exit 3
fi