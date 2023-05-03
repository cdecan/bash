#!/bin/bash
#
# method_name.sh: attempts to extract the name of a public static method from a specified Java file
#
#Usage: method_name.sh java-file

if [[ $# != 1 ]]; then
    echo "Usage: method_name.sh java-file" >&2
    exit 1
fi

var=$(grep -Eo "public +static +.+" $1)
if [[ $var != "" ]]; then
    var=${var%%\(*}
    var=$(echo "$var" | grep -Eo "public +static +.+ +[a-zA-Z0-9]+")
    var=${var##* }
    echo "$var"
fi