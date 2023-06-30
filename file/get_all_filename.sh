#!/bin/bash

function test {
    for item in $(ls -a $1)
    do
        if [[ "$item" == "." || "$item" == ".." ]] ;then
            continue
        fi

        full_name="$1/$item"
        if [ -d "$full_name" ];then
            test "$full_name"
        else 
            echo "$full_name"
        fi
    done
}

if [ -z "$1" ]
then
    echo "args error"
else
    test "$1"
fi

